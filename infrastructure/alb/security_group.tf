resource "aws_security_group" "lb_sg" {
  vpc_id = var.vpc_id
  name   = "code-runner-lb-sg"

  ingress {
    description = "Allow HTTP access from all IPs"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    description = "Allow all traffic out"
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    Name = "code-runner-lb-sg"
  }
}
