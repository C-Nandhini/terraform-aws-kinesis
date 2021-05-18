# igw example outputs

output "arn" {
  value = aws_internet_gateway.main.arn
  description = "internet gateway arn"
}

output "id" {
  value = aws_internet_gateway.main.id
  description = "internet gateway id"
}
