variable "aws_iam_user"{
  description = "AWS user account"
  default     = ""
}
variable "aws_access_key"{
  description = "AWS acess key"
  default     = ""
}
variable "aws_secret_key"{
  description = "Aws secret key"
  default     = ""
}
variable "aws_region"{
  description = "bucket acl"
  default     = "us-west-2"
}

variable "name" {
  description = "bucket name"
  default     = "terraform-user-test-bucket"
}

variable "acl" {
  description = "bucket acl"
  default     = "private"
}

variable "enable_versioning" {
  description = "enable bucket versioning"
  default     = "false"
}

variable "tags" {
  type        = "map"
  description = "tags"
  default     = {}
}

variable "lifecycle" {
  description = "lifecycle"
  default     = {}
}
