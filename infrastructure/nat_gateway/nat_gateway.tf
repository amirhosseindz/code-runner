module "vpc" {
  source = "../vpc"
}

resource "aws_eip" "nat_eip" {
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = module.vpc.public_subnet_id

  tags = {
    Name = "code-runner-nat-gateway"
  }
}
