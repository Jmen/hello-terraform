
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}

variable "environment" {}

variable "count" {}

resource "aws_s3_bucket" "my-website-jaimen" {
  count = "${var.count}"
  bucket = "my-website-jaimen-${var.environment}-${count.index + 1}"
  acl    = "public-read"
  force_destroy = true
#   policy = <<EOF
# {
#   "Version":"2012-10-17",
#   "Statement":[{
# 	"Sid":"PublicReadGetObject",
#         "Effect":"Allow",
# 	  "Principal": "*",
#       "Action":["s3:GetObject"],
#       "Resource":["arn:aws:s3:::my-website-jaimen-${var.environment}-${count.index + 1}/*"]
#     }
#   ]
# }
#   EOF

#   website {
#     index_document = "index.html"
#     error_document = "error.html"
#   }
}

# resource "null_resource" "remove_and_upload_to_s3" {
#   count = "${var.count}"
#   provisioner "local-exec" {
#     command = "aws s3 sync ${path.module}/website s3://${element(aws_s3_bucket.my-website-jaimen.*.id, count.index)}"
#   }
# }
