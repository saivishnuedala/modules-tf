output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.play.id
}
output "public_cidrs" {
  description = "Public subnet CIDR's"
  value       = aws_subnet.public_subnet[*].id
}

output "private_cidrs" {
  value = aws_subnet.private_subnet.*.id
}

# output "security_group_ids" {
#   value = aws_security_group.test_sg.id
# }
