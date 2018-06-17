
resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  name        = "${var.firehose_name}"
  destination = "${var.destination}",
  kinesis_source_configuration {
    kinesis_stream_arn="${var.kinesis_Source}",
    role_arn="${var.role_arn}"
  }

  extended_s3_configuration {
    role_arn   = "${aws_iam_role.firehose_role.arn}"
    bucket_arn = "${var.s3bucket}"
    processing_configuration = [
      {
        enabled = "${var.proc_enabled}"
        processors = [
          {
            type = "${var.proc_type}"
            parameters = [
              {
                parameter_name = "LambdaArn"
                parameter_value = "${var.lambda_arn}:$LATEST"
              }
            ]
          }
        ]
      }
    ]
  }
}

resource "aws_iam_role" "firehose_role" {
  name = "firehose_test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
