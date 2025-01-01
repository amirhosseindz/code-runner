resource "aws_instance" "code_runner" {
  ami             = "ami-0e54671bdf3c8ed8d" # Amazon Linux 2 AMI
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.code_runner_key.key_name
  vpc_security_group_ids = [ aws_security_group.code_runner_sg.id ]
  subnet_id = var.private_subnet_id
  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name

  # Install Go and run the app
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
  EOF

  tags = {
    Name = "code-runner-instance"
  }
}
