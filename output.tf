output "vpc_id" {
  value = module.vpc.vpc_id
}

output "internet_gateway_id" {
  value = module.gateways.internet_gateway_id
}

output "nat_gateway_id" {
  value = module.gateways.nat_gateway_id
}

output "nat_eip" {
  value = module.gateways.nat_eip
}



output "public_lb_dns" {
  value = module.load_balancers.public_lb_dns
}

output "private_lb_dns" {
  value = module.load_balancers.private_lb_dns
}


output "public_ips" {
  description = "Public IPs of all EC2 instances"
  value       = module.instances.public_ips
}

output "private_ips" {
  description = "Private IPs of all EC2 instances"
  value       = module.instances.private_ips
}



output "public_route_table_id" {
  description = "ID of the public route table"
  value       = module.route_tables.public_route_table_id
}

output "private_route_table_id" {
  description = "ID of the private route table"
  value       = module.route_tables.private_route_table_id
}

