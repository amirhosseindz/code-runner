resource "aws_route_table" "private_route_table" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "code-runner-private-route-table"
  }
}

resource "aws_route" "private_internet_access" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = module.vpc.private_subnet_id
  route_table_id = aws_route_table.private_route_table.id
}
