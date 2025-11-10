using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RobloxFiles;
using Sentrix.Obfuscator.Web.Services;
using Controller = Microsoft.AspNetCore.Mvc.Controller;

namespace Sentrix.Obfuscator.Web.Controllers;

[ApiController]
[Authorize]
[Route("[controller]/[action]")]
public class FileProcessingController(ISecuringService securingService) : Controller
{
    [HttpPost]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IResult> Rbxl(IFormFile file, CancellationToken ct)
    {
        if (file.Length == 0)
            return Results.BadRequest("No file Uploaded.");
        if (!file.FileName.EndsWith(".rbxl"))
            return Results.BadRequest("Required file extension is .rbxl");

        byte[] buffer = new byte[file.Length];
        await using var readStream = file.OpenReadStream();
        using (MemoryStream ms = new MemoryStream())
        {
            int read;
            while ((read = await readStream.ReadAsync(buffer, 0, buffer.Length, ct)) > 0)
            {
                ms.Write(buffer, 0, read);
            }
            buffer = ms.ToArray();
        }
            
        RobloxFile robloxFile = await RobloxFile.OpenAsync(buffer);
        RobloxFile securedFile = securingService.SecureRoblox(robloxFile);
            
        var tmpDir = Path.Combine(Path.GetTempPath(), "sentrix");
        Directory.CreateDirectory(tmpDir);
        var tmpFile = Path.Combine(tmpDir, Guid.NewGuid() + ".rbxl");
        await securedFile.SaveAsync(tmpFile);

        HttpContext.Response.OnCompleted(() =>
        {
            try { System.IO.File.Delete(tmpFile); }
            catch
            {
                // ignored
            }
            return Task.CompletedTask;
        });
            
        var contentType = string.IsNullOrWhiteSpace(file.ContentType)
            ? "application/octet-stream"
            : file.ContentType;
            
        var resultReadStream = System.IO.File.OpenRead(tmpFile);
        return Results.File(resultReadStream, contentType, file.FileName);
    }
}