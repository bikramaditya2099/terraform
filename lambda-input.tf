variable "s3_bucket" {
  default = "bucket-name"
}
variable "s3_key" {
  default = "test.jar"
}
variable "function_name" {
  default = "terraform-firehose_lambda_processor"
}
variable "handler" {
  default = "LambdaHandler::handleRequest"
}
variable "runtime" {
  default = "java8"
}
