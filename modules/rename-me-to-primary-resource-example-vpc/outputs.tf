# vpc example outputs

output "arn" {
  value = aws_vpc.main.arn
  description = "vpc-arn"
}

output "id" {
  value = aws_vpc.main.id
  description = "vpc-id"
}
