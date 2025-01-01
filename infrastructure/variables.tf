variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "availability_zones" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}
