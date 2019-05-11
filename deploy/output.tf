output "arn" {
  value = "${module.hello_terraform_lambda.lambda_arn}"
}

output "version" {
  value = "${module.hello_terraform_lambda.lambda_version}"
}
