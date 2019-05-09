output "bucket-1" {
  value = "${module.bucket-1.bucket_arn}"
}

output "bucket-2" {
  value = "${module.bucket-2.bucket_arn}"
}

output "queue_arn-1" {
  value = "${module.hello-queue-1.this_sqs_queue_arn}"
}

output "queue_arn-2" {
  value = "${module.hello-queue-2.this_sqs_queue_arn}"
}