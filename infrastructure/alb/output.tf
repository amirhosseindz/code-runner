output "lb_sg_id" {
  value = aws_security_group.lb_sg.id
}

output "alb_dns_name" {
  value = aws_alb.code_runner_alb.dns_name
}
