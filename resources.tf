terraform {
  backend "s3" {}
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}

variable "environment" {}

module "bucket-1" {
  source = "./modules/s3"
  name = "jaimen-s3-${var.environment}-1"
}
