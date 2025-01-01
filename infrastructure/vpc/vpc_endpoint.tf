resource "aws_vpc_endpoint" "ssm" {
  vpc_id       = aws_vpc.main_vpc.id
  service_name = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"
  subnet_ids   = [ aws_subnet.private_subnet.id ]
  security_group_ids = [ var.code_runner_sg_id ]

  tags = {
    Name = "SSM VPC Endpoint"
  }
}

resource "aws_vpc_endpoint" "ssm_messages" {
  vpc_id       = aws_vpc.main_vpc.id
  service_name = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type = "Interface"
  subnet_ids   = [ aws_subnet.private_subnet.id ]
  security_group_ids = [ var.code_runner_sg_id ]

  tags = {
    Name = "SSM Messages VPC Endpoint"
  }
}

resource "aws_vpc_endpoint" "ec2_messages" {
  vpc_id       = aws_vpc.main_vpc.id
  service_name = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"
  subnet_ids   = [ aws_subnet.private_subnet.id ]
  security_group_ids = [ var.code_runner_sg_id ]

  tags = {
    Name = "EC2 Messages VPC Endpoint"
  }
}
