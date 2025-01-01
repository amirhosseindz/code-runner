variable "vpc_id" {
  description = "The ID of the VPC"
  type = string
}

variable "public_subnet_ids" {
  description = "The IDs of the public subnets"
  type = list(string)
}

variable "code_runner_id" {
  description = "Instance id of the code runner"
  type = string
}

variable "code_runner_sg_id" {
  description = "Security group id of the code runner"
  type = string
}
