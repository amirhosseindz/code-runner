resource "aws_key_pair" "code_runner_key" {
  key_name = "code-runner-key"
  public_key = file("~/.ssh/code-runner.pub")
}
