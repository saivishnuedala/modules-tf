output "public_cidrs" {
  description = "Public subnet CIDR's"
  value       = toset(aws_subnet.public_subnet[*].id)
}

output "private_cidrs" {
  value = aws_subnet.private_subnet.*.id
}

output "security_group_ids" {
  value = aws_security_group.test_sg.id
}
