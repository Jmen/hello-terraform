using System;
using System.Linq;
using Amazon.Lambda.APIGatewayEvents;

namespace HelloTerraformDotNetCore.ConsoleTester
{
    internal static class Program
    {
        private static void Main(string[] args)
        {
            var func = new Function();
            
            var result = func.FunctionHandler(new APIGatewayProxyRequest(), new FakeLambdaContext());
            
            Console.WriteLine(string.Join(',', result.Headers.Select(x => $"{x.Key}={x.Value}")));
            Console.WriteLine(result.StatusCode);
            Console.WriteLine(result.Body);
        }
    }
}