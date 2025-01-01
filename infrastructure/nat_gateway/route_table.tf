resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  tags = {
    Name = "code-runner-private-route-table"
  }
}

resource "aws_route" "private_internet_access" {
  count = length(aws_nat_gateway.nats)
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = element(["0.0.0.0/1", "128.0.0.0/1"], count.index)
  nat_gateway_id         = aws_nat_gateway.nats[count.index].id
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private_route_table.id
}
