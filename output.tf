output "website_endpoint" {
  value = ["${aws_s3_bucket.my-website-jaimen.*.website_endpoint}"]
}