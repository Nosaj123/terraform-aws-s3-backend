variable "aws_region" {
  description = "aws region to deploy"
  type        = string
}

variable "aws_s3_bucket" {
  description = "Name of the S3 Bucket to store terraform state file"
  type        = string
}


variable "aws_dynamodb_table" {
  description = "Name of DynamoDB Table"
  type        = string
}

variable "aws_dynamodb_table_key" {
  description = "Partition Key"
  type        = string
  default = "LockID"
}