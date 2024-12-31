provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source = "./vpc"

  cidr_block = "10.0.0.0/16"
}

module "nat_gateway" {
  source = "./nat_gateway"

  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
}

module "ec2" {
  source = "./ec2"

  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet_id
}
