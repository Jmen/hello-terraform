terraform {
  backend "s3" {}
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}

provider "archive" {}

data "archive_file" "zip" {
  type        = "zip"
  source_file = "../../../../../../index.js"
  output_path = "../../../../../../lambda.zip"
}

variable "environment" {}

module "hello_terraform_lambda" {
  source            = "./modules/lambda"
  
  name              = "hello-terraform-${var.environment}"
  runtime           = "nodejs8.10"
  handler           = "index.handler"
  filename          = "${data.archive_file.zip.output_path}"
  source_code_hash  = "${data.archive_file.zip.output_base64sha256}"
}

module "hello_terraform_api_gateway" {
  source            = "./modules/api-gateway"

  name              = "hello-terraform-${var.environment}"
  lambda_arn        = "${module.hello_terraform_lambda.lambda_arn}"
  lambda_invoke_arn = "${module.hello_terraform_lambda.lambda_invoke_arn}"
}

module "hello_terraform_dotnet_lambda" {
  source            = "./modules/lambda"
  
  name              = "hello-terraform-dotnet-${var.environment}"
  runtime           = "dotnetcore2.1"
  handler           = "HelloDotnetTerraform::HelloDotnetTerraform.Function::FunctionHandler"
  filename          = "../../../../../../dotnet-lambda.zip"
  source_code_hash  = "${base64sha256(file("../../../../../../dotnet-lambda.zip"))}"
}

module "hello_terraform_api_gateway_dotnet" {
  source            = "./modules/api-gateway"

  name              = "hello-terraform-${var.environment}"
  lambda_arn        = "${module.hello_terraform_dotnet_lambda.lambda_arn}"
  lambda_invoke_arn = "${module.hello_terraform_dotnet_lambda.lambda_invoke_arn}"
}