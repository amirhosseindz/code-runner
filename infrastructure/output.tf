output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "nat_ips" {
  value = module.nat_gateway.nat_ips
}
