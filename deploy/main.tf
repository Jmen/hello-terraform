terraform {
  backend "s3" {}
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}

variable "environment" {}

module "hello_terraform_dotnet_lambda" {
  source            = "./modules/lambda"
  
  name              = "hello-terraform-dotnet-${var.environment}"
  runtime           = "dotnetcore2.1"
  handler           = "HelloDotnetTerraform::HelloDotnetTerraform.Function::FunctionHandler"
  filename          = "../../../../../../output/lambda.zip"
  source_code_hash  = "${base64sha256(file("../../../../../../output/lambda.zip"))}"
}

module "hello_terraform_api_gateway_dotnet" {
  source            = "./modules/api-gateway"

  name              = "hello-terraform-${var.environment}-dotnet"
  lambda_arn        = "${module.hello_terraform_dotnet_lambda.lambda_arn}"
  lambda_invoke_arn = "${module.hello_terraform_dotnet_lambda.lambda_invoke_arn}"
}
