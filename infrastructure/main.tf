provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source = "./vpc"
}

module "nat_gateway" {
  source = "./nat_gateway"
}

module "ec2" {
  source = "./ec2"
}
