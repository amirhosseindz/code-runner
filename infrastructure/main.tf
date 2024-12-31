terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    bucket = "code-runner-terraform-state"
    key = "terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}

provider "aws" {
  region = "eu-central-1"
}
