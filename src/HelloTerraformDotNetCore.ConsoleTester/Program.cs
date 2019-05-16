using System;
using System.Linq;
using Amazon.Lambda.APIGatewayEvents;
using Amazon.Lambda.Core;

namespace HelloTerraformDotNetCore.ConsoleTester
{
    class FakeLambdaContext : ILambdaContext
    {
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
    
    class Program
    {
        static void Main(string[] args)
        {
            var func = new Function();

            var fakeLambdaContext = new FakeLambdaContext();
            
            var result = func.FunctionHandler(new APIGatewayProxyRequest(), fakeLambdaContext);
            
            Console.WriteLine(string.Join(',', result.Headers.Select(x => $"{x.Key}={x.Value}")));
            Console.WriteLine(result.StatusCode);
            Console.WriteLine(result.Body);
        }
    }
}