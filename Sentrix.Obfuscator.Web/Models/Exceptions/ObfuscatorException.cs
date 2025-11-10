namespace Sentrix.Obfuscator.Web.Models.Exceptions;

public class ObfuscatorException(IReadOnlyList<string> errors) : System.Exception
{
    public IReadOnlyList<string> Errors = errors;

    public override string ToString()
    {
        return $"{GetType().Name}: {string.Join(Environment.NewLine, Errors)}";
    }
}