output "public_ips" {
  value = [for instance in aws_instance.ec2 : instance.public_ip if instance.associate_public_ip_address]
}

output "private_ips" {
  value = [for instance in aws_instance.ec2 : instance.private_ip]
}


