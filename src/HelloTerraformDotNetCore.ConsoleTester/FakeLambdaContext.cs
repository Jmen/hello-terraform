using System;
using Amazon.Lambda.Core;

namespace HelloTerraformDotNetCore.ConsoleTester
{
    internal class FakeLambdaContext : ILambdaContext
    {
        public FakeLambdaContext()
        {
            Logger = new LocalLogger();
        }
        
        public string AwsRequestId { get; }
        public IClientContext ClientContext { get; }
        public string FunctionName { get; }
        public string FunctionVersion { get; }
        public ICognitoIdentity Identity { get; }
        public string InvokedFunctionArn { get; }
        public ILambdaLogger Logger { get; }
        public string LogGroupName { get; }
        public string LogStreamName { get; }
        public int MemoryLimitInMB { get; }
        public TimeSpan RemainingTime { get; }
    }
}