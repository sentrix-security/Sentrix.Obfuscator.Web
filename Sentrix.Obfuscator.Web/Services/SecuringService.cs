using System.Diagnostics;
using System.Text;
using Loretta.CodeAnalysis.Lua;
using RobloxFiles;
using RobloxFiles.DataTypes;
using Sentrix.Obfuscator.Web.Models.Enums;
using Sentrix.Obfuscator.Web.Models.Exceptions;
using Script = RobloxFiles.Script;

namespace Sentrix.Obfuscator.Web.Services;

    public class SecuringService(ILogger<SecuringService> logger) : ISecuringService
    {
        private readonly ILogger _logger = logger;
        private readonly string _secureScriptTopInject = File.ReadAllText("Snippets/secure_script_top.lua");

        // Constants \\
        private static readonly string SecureTag = "--!sentrix:secure";
        private static readonly string NoSecureTag = "--!sentrix:nosecure";
        private static readonly string ObfuscateTag = "--!sentrix:obfuscate";
        public static readonly Encoding ScriptEncoding = Encoding.UTF8;

        // Log Events \\
        private static readonly EventId EvtRobloxSecureStart = new(1000, nameof(SecureRoblox) + "_Start");
        private static readonly EventId EvtRobloxSecureEnd = new(1001, nameof(SecureRoblox) + "_End");
        private static readonly EventId EvtContainerSkipped = new(1010, "Container.Skipped");
        private static readonly EventId EvtContainerProcessing = new(1010, "Container.Processing");
        private static readonly EventId EvtError = new(1999, "Error");

        /// <summary>
        /// Gets a <see cref="EnumScriptSecuringMethod"/> based on the given line \\/>
        /// </summary>
        /// <param name="line">The input line</param>
        /// <param name="exclusive">Use Exclusive method?</param>
        /// <returns></returns>
        private static EnumScriptSecuringMethod GetScriptSecuringMethodSpan(ReadOnlySpan<char> line, bool exclusive)
        {
            bool hasSecure = line.Contains(SecureTag.AsSpan(), StringComparison.Ordinal);
            bool hasNoSecure = line.Contains(NoSecureTag.AsSpan(), StringComparison.Ordinal);
            bool hasObfuscate = line.Contains(ObfuscateTag.AsSpan(), StringComparison.Ordinal);

            if (exclusive)
            {
                // Exlusive mode secures everything unless we have the nosecure tag \\
                // If we have the obfuscate tag, then we only obfuscate \\
                if (hasNoSecure) return EnumScriptSecuringMethod.None;
                if (hasObfuscate) return EnumScriptSecuringMethod.Obfuscate;
                return EnumScriptSecuringMethod.Secure;
            }

            // Inclusive mode only secures if we have the secure tag \\
            // and only obfuscates if we have the obfuscate tag \\
            if (hasSecure) return EnumScriptSecuringMethod.Secure;
            if (hasObfuscate) return EnumScriptSecuringMethod.Obfuscate;
            return EnumScriptSecuringMethod.None;
        }

        /// <summary>
        /// Secures or obfuscates a given string using <see cref="GetScriptSecuringMethodSpan"/>
        /// </summary>
        /// <param name="code">The Code</param>
        /// <param name="exclusive">Wether to use exclusive mode or not</param>
        /// <returns>Obfuscated code or null (when we have <see cref="EnumScriptSecuringMethod"/>.None)</returns>
        private string? SecureOrObfuscate(string code, bool exclusive = false)
        {
            // Use Spans here so we do not allocate memory just for the first line \\
            ReadOnlySpan<char> span = code.AsSpan();
            int nl = span.IndexOf('\n');
            ReadOnlySpan<char> firstLineSpan = nl >= 0 ? span[..nl] : span;

            // Get the method to use \\
            EnumScriptSecuringMethod method = GetScriptSecuringMethodSpan(firstLineSpan, exclusive);

            if (method == EnumScriptSecuringMethod.None) return null;
            if (method == EnumScriptSecuringMethod.Obfuscate) return this.ObfuscateLua(code);
            if (method == EnumScriptSecuringMethod.Secure) return this.SecureLua(code);
            return null;
        }

        public RobloxFile SecureRoblox(RobloxFile file, bool exclusive = false)
        {
            // Create a scope for logging \\
            using var logScope = _logger.BeginScope(new Dictionary<string, object?>
            {
                ["Exclusive"] = exclusive,
                ["Root"] = file.GetFullName()
            });

            // Read time we taking for diagnostics \\
            var stopwatch = Stopwatch.StartNew();
            _logger.LogInformation(EvtRobloxSecureStart, "Starting securing pass for {Root}", file.GetFullName());

            LuaSourceContainer[] sourceContainers = file.GetDescendantsOfType<LuaSourceContainer>();

            // Values for reporting \\
            int totalContainers = sourceContainers.Length;
            int modifiedContainers = 0, skippedContainers = 0, failedContainers = 0;

            _logger.LogDebug("Found {Count} LuaSourceContainers", totalContainers);

            // Process SourceContainers \\
            foreach (var sourceContainer in sourceContainers)
            {
                string containerPath = sourceContainer.GetFullName();
                _logger.LogTrace(EvtContainerProcessing, "Processing SourceContainer {Container}", containerPath);

                try
                {
                    ProtectedString? source = sourceContainer switch
                    {
                        ModuleScript ms => ms.Source,
                        LocalScript ls => ls.Source,
                        Script s => s.Source,
                        _ => null
                    };

                    // Skip if we have no source \\
                    if (source is null)
                    {
                        skippedContainers++;
                        _logger.LogDebug("Skipped {Container}: no source", containerPath);
                        continue;
                    }

                    // Secure if needed \\
                    string? secured = SecureOrObfuscate(source, exclusive);

                    // Skip if we did not obfuscate/secure \\
                    if (secured is null)
                    {
                        skippedContainers++;
                        continue;
                    }

                    // Write source back to containers \\
                    switch (sourceContainer)
                    {
                        case ModuleScript ms:
                            ms.Source = secured; break;
                        case LocalScript ls:
                            ls.Source = secured; break;
                        case Script s:
                            s.Source = secured; break;
                    }

                    modifiedContainers++;
                }
                catch (System.Exception e)
                {
                    failedContainers++;
                    _logger.LogError(EvtError, e, "Failed to secure {Container}", containerPath);
                }
            }

            stopwatch.Stop();
            _logger.LogInformation(EvtRobloxSecureEnd, "Finished securing pass for {Root} in {Elapsed} ms - total={Total}, modified={Modified}, skipped={Skipped}, failed={Failed}",
                file.GetFullName(), stopwatch.ElapsedMilliseconds, totalContainers, modifiedContainers, skippedContainers, failedContainers);

            if (failedContainers > 0) throw new SecuringException("At least one script failed to secure");
            
            return file;
        }

        public string ObfuscateLua(string lua)
        {
            LuaSyntaxTree syntaxTree = (LuaSyntaxTree)LuaSyntaxTree.ParseText(lua);
            var result = new Obfuscator(syntaxTree, false, true, false).ObfuscateNode();

            if (result.Item1 is null)
            {
                _logger.LogError(EvtError, "Obfuscation Failed: {errorlist}", string.Join(", ", result.Item2));
                throw new ObfuscatorException(result.Item2);
            }

            return result.Item1.ToFullString();
        }

        public string SecureLua(string lua)
        {
            // We fallback to obfuscation for now \\
            logger.LogWarning("Emil said we should not support securing yet, only obfuscation, thanks");
            return this.ObfuscateLua(lua);
            
            StringBuilder builder = new StringBuilder(lua);
            builder.Insert(0, _secureScriptTopInject);
            return this.ObfuscateLua(builder.ToString());
        }
    }