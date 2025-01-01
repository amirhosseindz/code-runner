resource "aws_subnet" "public_subnets" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, count.index)
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "code-runner-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 4, length(var.availability_zones))

  tags = {
    Name = "code-runner-private-subnet"
  }
}
