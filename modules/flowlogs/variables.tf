variable "aws_s3_bucket" {
  description = "S3 bucket"
  type        = any
}

variable "aws_vpc" {
    description = "VPC for flowlogs"
    type = any
}