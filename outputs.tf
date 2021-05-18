# sample outputs

output "vpc_arn" {
  value = module.vpc[*].arn
  description = "vpc-arn"
}

output "vpc_id" {
  value = element(concat(module.vpc[*].id, [""]), 0)
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

