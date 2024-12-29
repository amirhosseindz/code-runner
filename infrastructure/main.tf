provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "code-runner-terraform-state"
    key = "terraform/state"
    region = "eu-central-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "code-runner-terraform-state"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_acl" "terraform_state_acl" {
  bucket = aws_s3_bucket.terraform_state.bucket
  acl = "private"
}

resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Environment = "Production"
        Application = "CodeRunner"
    }
}

