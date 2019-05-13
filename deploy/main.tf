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

# module "hello_terraform_lambda" {
#   source            = "./modules/lambda"
  
#   name              = "hello-terraform-${var.environment}"
#   filename          = "${data.archive_file.zip.output_path}"
#   source_code_hash  = "${data.archive_file.zip.output_base64sha256}"
# }

# module "hello_terraform_api_gateway" {
#   source            = "./modules/api-gateway"

#   name              = "hello-terraform-${var.environment}"
#   lambda_arn        = "${module.hello_terraform_lambda.lambda_arn}"
#   lambda_invoke_arn = "${module.hello_terraform_lambda.lambda_invoke_arn}"
# }
