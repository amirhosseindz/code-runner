resource "aws_instance" "code_runner" {
  ami             = "ami-0e54671bdf3c8ed8d" # Amazon Linux 2 AMI
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.code_runner_key.key_name
  security_groups = [aws_security_group.code_runner_sg.name]

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "code-runner-instance"
  }
}

resource "aws_eip" "code_runner_eip" {
  instance = aws_instance.code_runner.id
}
