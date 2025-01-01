output "nat_ips" {
  value = [ for nat in aws_eip.nat_eips : nat.public_ip ]
}
