provider "aws" {
  region = var.region
}

module "ec2" {
  source = "./ec2"
}
