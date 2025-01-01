output "code_runner_id" {
  value = aws_instance.code_runner.id
}

output "code_runner_sg_id" {
  value = aws_security_group.code_runner_sg.id
}
