# create vpc

module "vpc" {
  count = length(var.cidr_block) > 0 ? 1 : 0

  source                         = "./modules/vpc"
  cidr_block                     = var.cidr_block
  instance_tenancy               = var.instance_tenancy
  enable_dns_support             = var.enable_dns_support
  enable_dns_hostnames           = var.enable_dns_hostnames
  enable_classiclink             = var.enable_classiclink
  enable_classiclink_dns_support = var.enable_classiclink_dns_support

  name        = var.vpc_name
  environment = var.environment

  tags = merge(
    var.tags,
    var.tags_vpc
  )
}

# create internet_gateway

module "internet_gateway" {
  count = length(var.cidr_block) > 0 && var.create_internet_gateway ? 1 : 0

  source = "./modules/internet_gateway"
  vpc_id = module.vpc[0].id

  name        = var.internet_gateway_name
  environment = var.environment

  tags = merge(
    var.tags,
    var.tags_internet_gateway
  )
}

# create private_subnets

module "private_subnets" {
  count = length(var.cidr_block) > 0 && var.create_private_subnets && length(var.private_subnets) > 0 && length(var.private_subnets) == length(var.availability_zone_private) ? length(var.private_subnets) : 0

  source                   = "./modules/subnet"
  availability_zone_subnet = var.availability_zone_private[count.index]
  cidr_block_subnet        = var.private_subnets[count.index]
  vpc_id                   = module.vpc[0].id

  name        = "${var.private_subnets_name}-${count.index}"
  environment = var.environment

  create_timeout_subnet = var.create_timeout_subnet
  delete_timeout_subnet = var.delete_timeout_subnet

  tags = merge(
    var.tags,
    var.tags_private_subnets
  )
}

# create private_route_table

module "private_route_table" {
  count = length(var.cidr_block) > 0 && var.create_private_route_table ? 1 : 0

  source = "./modules/route_table"
  vpc_id = module.vpc[0].id

  name        = var.private_route_table_name
  environment = var.environment

  tags = merge(
    var.tags,
    var.tags_private_route_table
  )
}

# create private_route_table_association 

module "private_route_table_association" {
  count = length(var.cidr_block) > 0 && var.create_private_route_table && var.create_private_subnets && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0

  source         = "./modules/route_table_association_subnet"
  subnet_id      = module.private_subnets[count.index].id
  route_table_id = module.private_route_table[0].id
}

# create private_routes

module "private_route" {
  count = length(var.cidr_block) > 0 && var.create_internet_gateway && var.create_nat_gateway && var.create_private_route_table && var.create_private_route ? 1 : 0

  source                 = "./modules/route"
  route_table_id         = module.private_route_table[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.nat_gateway[0].id

  create_timeout_route = var.create_timeout_route
  delete_timeout_route = var.delete_timeout_route
}

# create public_subnets

module "public_subnets" {
  count = length(var.cidr_block) > 0 && var.create_public_subnets && length(var.public_subnets) > 0 && length(var.public_subnets) == length(var.availability_zone_public) ? length(var.public_subnets) : 0

  source                   = "./modules/subnet"
  availability_zone_subnet = var.availability_zone_public[count.index]
  cidr_block_subnet        = var.public_subnets[count.index]
  vpc_id                   = module.vpc[0].id

  name        = "${var.public_subnets_name}-${count.index}"
  environment = var.environment

  create_timeout_subnet = var.create_timeout_subnet
  delete_timeout_subnet = var.delete_timeout_subnet

  tags = merge(
    var.tags,
    var.tags_public_subnets
  )
}

# create public_route_table

module "public_route_table" {
  count = length(var.cidr_block) > 0 && var.create_public_route_table ? 1 : 0

  source = "./modules/route_table"
  vpc_id = module.vpc[0].id

  name        = var.public_route_table_name
  environment = var.environment

  tags = merge(
    var.tags,
    var.tags_public_route_table
  )
}

# create public_route_table_association 
module "public_route_table_association" {
  count = length(var.cidr_block) > 0 && var.create_public_route_table && var.create_public_subnets && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0

  source         = "./modules/route_table_association_subnet"
  subnet_id      = module.public_subnets[count.index].id
  route_table_id = module.public_route_table[0].id
}

# create public_route

module "public_route" {
  count = length(var.cidr_block) > 0 && var.create_internet_gateway && var.create_public_route_table && var.create_public_route ? 1 : 0

  source                 = "./modules/route"
  route_table_id         = module.public_route_table[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.internet_gateway[0].id

  create_timeout_route = var.create_timeout_route
  delete_timeout_route = var.delete_timeout_route
}

# create eip

module "eip" {
  count = length(var.cidr_block) > 0 && var.create_internet_gateway && var.create_eip ? 1 : 0

  source = "git@github.com:sede-x/terraform-aws-eip.git"

  depends_on = [module.internet_gateway]

  name        = var.eip_name
  environment = var.environment

  tags = merge(
    var.tags,
    var.tags_eip
  )
}

# create nat_gateway

module "nat_gateway" {
  count = length(var.cidr_block) > 0 && var.create_eip && var.create_internet_gateway && var.create_nat_gateway && var.create_public_subnets && length(var.public_subnets) > 0 ? 1 : 0

  source        = "./modules/nat_gateway"
  allocation_id = module.eip[0].id
  subnet_id     = module.public_subnets[0].id

  name        = var.nat_gateway_name
  environment = var.environment

  tags = merge(
    var.tags,
    var.tags_nat_gateway
  )
}

# default security group

resource "aws_default_security_group" "default" {
  count = length(var.cidr_block) > 0 && var.manage_default_security_group ? 1 : 0

  vpc_id = module.vpc[0].id

  dynamic "ingress" {
    for_each = var.default_security_group_ingress
    content {
      self            = lookup(ingress.value, "self", null)
      cidr_blocks     = compact(split(",", lookup(ingress.value, "cidr_blocks", "")))
      security_groups = compact(split(",", lookup(ingress.value, "security_groups", "")))
      description     = lookup(ingress.value, "description", null)
      from_port       = lookup(ingress.value, "from_port", 0)
      to_port         = lookup(ingress.value, "to_port", 0)
      protocol        = lookup(ingress.value, "protocol", "-1")
    }
  }

  dynamic "egress" {
    for_each = var.default_security_group_egress
    content {
      self            = lookup(egress.value, "self", null)
      cidr_blocks     = compact(split(",", lookup(egress.value, "cidr_blocks", "")))
      security_groups = compact(split(",", lookup(egress.value, "security_groups", "")))
      description     = lookup(egress.value, "description", null)
      from_port       = lookup(egress.value, "from_port", 0)
      to_port         = lookup(egress.value, "to_port", 0)
      protocol        = lookup(egress.value, "protocol", "-1")
    }
  }

  tags = merge(
    {
      Name                = var.default_security_group_name
      Environment         = var.environment
      platform_IAC_Source = "terraform-aws-${var.repo_short_name}"
    },
    var.tags,
    var.tags_default_security_group,
  )
}


# default route table

resource "aws_default_route_table" "default" {
  count = length(var.cidr_block) > 0 && var.manage_default_route_table ? 1 : 0

  default_route_table_id = module.vpc[0].default_route_table_id

  dynamic "route" {
    for_each = var.default_route_table_routes
    content {
      # One of the following destinations must be provided
      cidr_block = route.value.cidr_block

      # One of the following targets must be provided
      gateway_id                = lookup(route.value, "gateway_id", null)
      instance_id               = lookup(route.value, "instance_id", null)
      nat_gateway_id            = lookup(route.value, "nat_gateway_id", null)
      network_interface_id      = lookup(route.value, "network_interface_id", null)
      transit_gateway_id        = lookup(route.value, "transit_gateway_id", null)
      vpc_endpoint_id           = lookup(route.value, "vpc_endpoint_id", null)
      vpc_peering_connection_id = lookup(route.value, "vpc_peering_connection_id", null)
    }
  }

  tags = merge(
    {
      Name                = var.default_route_table_name
      Environment         = var.environment
      platform_IAC_Source = "terraform-aws-${var.repo_short_name}"
    },
    var.tags,
    var.tags_default_route_table,
  )
}

# default network acl

resource "aws_default_network_acl" "default" {
  count = length(var.cidr_block) > 0 && var.manage_default_network_acl ? 1 : 0

  default_network_acl_id = module.vpc[0].default_network_acl_id

  dynamic "ingress" {
    for_each = var.default_network_acl_ingress
    content {
      action     = ingress.value.action
      cidr_block = lookup(ingress.value, "cidr_block", null)
      from_port  = ingress.value.from_port
      icmp_code  = lookup(ingress.value, "icmp_code", null)
      icmp_type  = lookup(ingress.value, "icmp_type", null)
      protocol   = ingress.value.protocol
      rule_no    = ingress.value.rule_no
      to_port    = ingress.value.to_port
    }
  }
  dynamic "egress" {
    for_each = var.default_network_acl_egress
    content {
      action     = egress.value.action
      cidr_block = lookup(egress.value, "cidr_block", null)
      from_port  = egress.value.from_port
      icmp_code  = lookup(egress.value, "icmp_code", null)
      icmp_type  = lookup(egress.value, "icmp_type", null)
      protocol   = egress.value.protocol
      rule_no    = egress.value.rule_no
      to_port    = egress.value.to_port
    }
  }

  tags = merge(
    {
      Name                = var.default_network_acl_name
      Environment         = var.environment
      platform_IAC_Source = "terraform-aws-${var.repo_short_name}"
    },
    var.tags,
    var.tags_default_network_acl,
  )
}
