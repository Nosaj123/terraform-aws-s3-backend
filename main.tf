#S3 Backend for Terraform using DynamoDB

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "s3-backend" {
  bucket = var.aws_s3_bucket
  force_destroy = "true"
}

resource "aws_s3_bucket_versioning" "s3-backend-versioning" {
  bucket = aws_s3_bucket.s3-backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "s3-backend" {
  name           = var.aws_dynamodb_table
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.aws_dynamodb_table_key
  attribute {
    name = var.aws_dynamodb_table_key
    type = "S"
  }
}