# output "website_endpoint" {
#   value = ["${aws_s3_bucket.my-website-jaimen.*.website_endpoint}"]
# }

output "queue_arn" {
  value = "${module.hello-queue.this_sqs_queue_arn}"
}
