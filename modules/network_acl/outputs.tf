# network_acl outputs

output "arn" {
  value = aws_network_acl.main.arn
}

output "id" {
  value = aws_network_acl.main.id
}

output "owner_id" {
  value = aws_network_acl.main.owner_id
}
