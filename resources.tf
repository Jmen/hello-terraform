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

module "bucket-2" {
  source = "./modules/s3"
  name = "jaimen-s3-${var.environment}-2"
}

module "hello-queue-1" {
  source = "terraform-aws-modules/sqs/aws"
  name = "hello-queue-${var.environment}-1"
}

module "hello-queue-2" {
  source = "terraform-aws-modules/sqs/aws"
  name = "hello-queue-${var.environment}-2"
}