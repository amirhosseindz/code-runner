resource "aws_security_group" "code_runner_sg" {
  name = "code-runner-sg"
  description = "Security group for code runner EC2 instance"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [var.lb_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "code-runner-sg"
  }
}

resource "aws_security_group_rule" "allow_alb_to_code_runner" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = var.lb_sg_id
  security_group_id = aws_security_group.code_runner_sg.id
}
