provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc"

  cidr_block         = var.cidr_block
  region             = var.region
  availability_zones = var.availability_zones
  code_runner_sg_id  = module.ec2.code_runner_sg_id
}

module "nat_gateway" {
  source = "./nat_gateway"

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_id = module.vpc.private_subnet_id
}

module "alb" {
  source = "./alb"

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  code_runner_id    = module.ec2.code_runner_id
  code_runner_sg_id = module.ec2.code_runner_sg_id
}

module "ec2" {
  source = "./ec2"

  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet_id
  lb_sg_id          = module.alb.lb_sg_id
}
