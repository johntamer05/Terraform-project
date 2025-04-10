output "public_sg_ids" {
  value = [
    aws_security_group.public_sg_1.id,
    aws_security_group.public_sg_2.id
  ]
}

output "private_sg_ids" {
  value = [
    aws_security_group.private_sg_1.id,
    aws_security_group.private_sg_2.id
  ]
}
