using RobloxFiles;

namespace Sentrix.Obfuscator.Web.Services;

/// <summary>
/// Service handling the Securing of Roblox and lua files
/// </summary>
public interface ISecuringService
{
    /// <summary>
    /// Secures a whole Roblox file<br/>
    ///<br/>
    /// Inclusive Mode:<br/>
    ///     - Secures (and obfuscates) all scripts with '--!sentrix:secure'<br/>
    ///     - Obfuscates all scripts with '--!sentrix:obfuscate'<br/>
    ///<br/>
    /// Exclusive Mode:<br/>
    ///     - Secures (and obfuscates) all scripts without '--!sentrix:nosecure'<br/>
    ///     - Only Obfuscates all scripts with `--!sentrix:obfuscate`<br/>
    /// </summary>
    /// <param name="file">The RobloxFile to modify</param>
    /// <param name="exclusive">wether to use exclusive mode or not</param>
    /// <returns></returns>
    public RobloxFile SecureRoblox(RobloxFile file, bool exclusive = false);
        
    /// <summary>
    /// Obfuscates a lua String
    /// </summary>
    /// <param name="lua">The Code</param>
    /// <returns></returns>
    public string ObfuscateLua(string lua);
        
    /// <summary>
    /// Secures and obfuscates a lua String
    /// </summary>
    /// <param name="lua">The Code</param>
    /// <returns></returns>
    public string SecureLua(string lua);
}