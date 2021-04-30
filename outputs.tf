# vpc outputs

output "vpc_arn" {
  value = module.vpc[*].arn
}

output "vpc_id" {
  value = module.vpc[*].id
}

output "vpc_cidr_block" {
  value = module.vpc[*].cidr_block
}

output "instance_tenancy" {
  value = module.vpc[*].instance_tenancy
}

output "enable_dns_support" {
  value = module.vpc[*].enable_dns_support
}

output "enable_dns_hostnames" {
  value = module.vpc[*].enable_dns_hostnames
}

output "enable_classiclink" {
  value = module.vpc[*].enable_classiclink
}

output "main_route_table_id" {
  value = module.vpc[*].main_route_table_id
}

output "default_network_acl_id" {
  value = module.vpc[*].default_network_acl_id
}

output "default_security_group_id" {
  value = module.vpc[*].default_security_group_id
}

output "default_route_table_id" {
  value = module.vpc[*].default_route_table_id
}

output "owner_id" {
  value = module.vpc[*].owner_id
}

# internet_gateway outputs

output "internet_gateway_arn" {
  value = module.internet_gateway[*].arn
}

output "internet_gateway_id" {
  value = module.internet_gateway[*].id
}

# private_subnets outputs

output "private_subnets_arn" {
  value = module.private_subnets[*].arn
}

output "private_subnets_id" {
  value = module.private_subnets[*].id
}

# private_route_table outputs

output "private_route_table_id" {
  value = module.private_route_table[*].id
}

#private_route_table_association outputs
output "private_route_table_association_id" {
  value = module.private_route_table_association[*].id
}

# public_subnets outputs

output "public_subnets_arn" {
  value = module.public_subnets[*].arn
}

output "public_subnets_id" {
  value = module.public_subnets[*].id
}

# public_route_table outputs

output "public_route_table_id" {
  value = module.public_route_table[*].id
}

#public_route_table_association outputs
output "public_route_table_association_id" {
  value = module.public_route_table_association[*].id
}

# eip outputs

output "eip_id" {
  value = module.eip[*].id
}

# nat_gateway outputs

output "nat_gateway_id" {
  value = module.nat_gateway[*].id
}

# default_security_group outputs

output "default_security_group_arn" {
  value = aws_default_security_group.default[*].arn
}

output "default_security_group_name" {
  value = aws_default_security_group.default[*].name
}

output "default_security_group_description" {
  value = aws_default_security_group.default[*].description
}

# default_network_acl outputs

output "default_network_acl_arn" {
  value = aws_default_network_acl.default[*].arn
}
