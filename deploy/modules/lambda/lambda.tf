resource "aws_lambda_function" "lambda" {
  function_name = "${var.name}"

  filename         = "${var.filename}"
  source_code_hash = "${var.source_code_hash}"

  role    = "${aws_iam_role.lambda_exec.arn}"
  handler = "index.handler"
  runtime = "nodejs8.10"
}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.name}-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:log-group:/aws/lambda/${var.name}:*"
    }
  ]
}
EOF
}

