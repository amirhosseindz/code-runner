resource "aws_alb" "code_runner_alb" {
  name = "code-runner-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [ aws_security_group.lb_sg.id ]
  subnets = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "code-runner-alb"
  }
}

resource "aws_alb_target_group" "code_runner_tg" {
  name = "code-runner-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"

  health_check {
    path = "/"
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_alb_listener" "code_runner_alb_listener" {
  load_balancer_arn = aws_alb.code_runner_alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.code_runner_tg.arn
  }
}

resource "aws_alb_target_group_attachment" "code_runner_attachment" {
  target_group_arn = aws_alb_target_group.code_runner_tg.arn
  target_id = var.code_runner_id
  port = 80
}
