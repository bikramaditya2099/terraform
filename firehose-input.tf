
variable "firehose_name"{
  default="terraform-kinesis-firehose-test-stream"
}
variable "destination"{
  default="extended_s3"
}
variable "kinesis_Source"{
  default="arn:aws:kinesis:us-west-2:*:stream/kinesis-stream"
}
variable "role_arn"{
  default="arn:aws:iam::*:role/role"
}
variable "proc_enabled"{
  default="true"
}
variable "proc_type"{
  default="Lambda"
}
