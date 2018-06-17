provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

module "lambda"{
  source = "lambda",
  s3_bucket = "${var.s3_bucket}",
  s3_key = "${var.s3_key}",
  function_name = "${var.function_name}",
  handler = "${var.handler}",
  runtime = "${var.runtime}"
}
module "s3_bucket" {
  source = "s3-bucket",
  aws_iam_user = "${var.aws_iam_user}",
  aws_secret_key = "${var.aws_secret_key}",
  aws_access_key="${var.aws_access_key}",
  acl = "${var.acl}",
  tags = "${var.tags}",
  lifecycle = "${var.lifecycle}",
  aws_region = "${var.aws_region}",
  name = "${var.name}",
  enable_versioning="${var.enable_versioning}"
}
module "firehose" {
  source = "firehose",
  firehose_name="${var.firehose_name}"
  s3bucket="${module.s3_bucket.s3_bucket_arn}",
  lambda_arn="${module.lambda.lambda_arn}",
  destination="${var.destination}",
  kinesis_Source="${var.kinesis_Source}",
  role_arn="${var.role_arn}",
  proc_enabled="${var.proc_enabled}",
  proc_type="${var.proc_type}"
}
