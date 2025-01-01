variable "region" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "cidr_block" {
  type = string
}

variable "code_runner_sg_id" {
  type = string
}
