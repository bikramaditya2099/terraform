variable "aws_iam_user"{}
variable "aws_access_key"{}
variable "aws_secret_key"{}
variable "aws_region"{}
variable "name" {}
variable "acl" {}
variable "enable_versioning" {}
variable "tags" {
  type        = "map"
}
variable "lifecycle" {}
