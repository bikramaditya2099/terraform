resource "aws_iam_role" "lambda_iam" {
  name = "lambda_iam"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda_processor" {
  s3_bucket="${var.s3_bucket}",
  s3_key="${var.s3_key}",
  function_name = "${var.function_name}"
  role = "${aws_iam_role.lambda_iam.arn}"
  handler = "${var.handler}"
  runtime = "${var.runtime}"
}
output "lambda_arn" {
  value = "${aws_lambda_function.lambda_processor.arn}"
}
