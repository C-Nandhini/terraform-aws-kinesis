# sample outputs

output "vpc_arn" {
  value = module.vpc[*].arn
  description = "vpc-arn"
}

output "vpc_id" {
  value = module.vpc[*].id
  description = "vpc-id"
}

output "internet_gateway_arn" {
  value = module.igw[*].arn
  description = "igw-arn"
}

output "internet_gateway_id" {
  value = module.igw[*].id
  description = "igw-id"
}

