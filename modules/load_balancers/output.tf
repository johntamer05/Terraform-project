output "public_lb_dns" {
  value = aws_lb.public_lb.dns_name
}

output "private_lb_dns" {
  value = aws_lb.private_lb.dns_name
}

output "public_tg_arn" {
  value = aws_lb_target_group.public_tg.arn
}

output "private_tg_arn" {
  value = aws_lb_target_group.private_tg.arn
}
