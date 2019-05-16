using Amazon.Lambda.Core;

namespace HelloTerraformDotNetCore.ConsoleTester
{
    internal class LocalLogger : ILambdaLogger
    {
        public void Log(string message)
        {
            LambdaLogger.Log(message);
        }

        public void LogLine(string message)
        {
            LambdaLogger.Log(message);
        }
    }
}