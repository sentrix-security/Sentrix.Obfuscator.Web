using System.Net.Http.Headers;
using System.Security.Claims;
using System.Text.Encodings.Web;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Options;

namespace Sentrix.Obfuscator.Web.Authentication;

public class ApiTokenAuthenticationHandler : AuthenticationHandler<AuthenticationSchemeOptions>
{
    public const string SchemeName = "ApiToken";
    private readonly IConfiguration _configuration;

    public ApiTokenAuthenticationHandler(
        IOptionsMonitor<AuthenticationSchemeOptions> options,
        ILoggerFactory logger,
        UrlEncoder encoder,
        ISystemClock clock,
        IConfiguration configuration) : base(options, logger, encoder, clock)
    {
        _configuration = configuration;
    }

    protected override Task<AuthenticateResult> HandleAuthenticateAsync()
    {
        // Read expected token from configuration
        var expectedToken = _configuration["Auth:ApiToken"];
        if (string.IsNullOrWhiteSpace(expectedToken))
        {
            return Task.FromResult(AuthenticateResult.Fail("API token is not configured."));
        }

        string? providedToken = null;

        if (Request.Headers.TryGetValue("Authorization", out var authHeaderValues))
        {
            var raw = authHeaderValues.ToString();
            if (AuthenticationHeaderValue.TryParse(raw, out var authHeader) &&
                string.Equals(authHeader.Scheme, "Bearer", StringComparison.OrdinalIgnoreCase))
            {
                providedToken = authHeader.Parameter;
            }
        }

        if (string.IsNullOrEmpty(providedToken) && Request.Headers.TryGetValue("X-API-KEY", out var apiKeyHeader))
        {
            providedToken = apiKeyHeader.ToString();
        }

        if (string.IsNullOrWhiteSpace(providedToken) || !string.Equals(providedToken, expectedToken, StringComparison.Ordinal))
        {
            return Task.FromResult(AuthenticateResult.Fail("Invalid or missing API token."));
        }

        var claims = new[]
        {
            new Claim(ClaimTypes.NameIdentifier, "api-token-user"),
            new Claim(ClaimTypes.Name, "ApiTokenUser")
        };
        var identity = new ClaimsIdentity(claims, SchemeName);
        var principal = new ClaimsPrincipal(identity);
        var ticket = new AuthenticationTicket(principal, SchemeName);

        return Task.FromResult(AuthenticateResult.Success(ticket));
    }

    protected override Task HandleChallengeAsync(AuthenticationProperties properties)
    {
        Response.StatusCode = 401;
        Response.Headers["WWW-Authenticate"] = "Bearer";
        return Task.CompletedTask;
    }
}