resource "aws_eip" "nat_eips" {
  count = length(var.public_subnet_ids)

  tags = {
    Name = "code-runner-nat-eip-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "nats" {
  count = length(var.public_subnet_ids)

  allocation_id = aws_eip.nat_eips[count.index].id
  subnet_id     = var.public_subnet_ids[count.index]

  tags = {
    Name = "code-runner-nat-gateway-${count.index + 1}"
  }
}
