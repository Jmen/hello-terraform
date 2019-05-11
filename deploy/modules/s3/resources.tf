resource "aws_s3_bucket" "my-bucket" {
  bucket = "${var.name}"
  acl    = "public-read"
  force_destroy = true
}