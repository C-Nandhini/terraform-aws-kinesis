# internet_gateway outputs

output "arn" {
  value = aws_internet_gateway.main.arn
}

output "id" {
  value = aws_internet_gateway.main.id
}

output "owner_id" {
  value = aws_internet_gateway.main.owner_id
}
