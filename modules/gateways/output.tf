output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.nat_gw.id
}

output "nat_eip" {
  description = "Elastic IP associated with the NAT Gateway"
  value       = aws_eip.nat_eip.public_ip
}
