# common variables

variable "tags" {
  description = "tags"
  type        = map(string)
  default     = {}
}

variable "repo_short_name" {
  description = "repo_short_name"
  type        = string
  default     = "vpc"
}

variable "environment" {
  description = "environment_name"
  type        = string
  default     = ""
}

# vpc variables

variable "cidr_block" {
  description = "cidr_block"
  type        = string
  default     = ""
}

variable "instance_tenancy" {
  description = "instance_tenancy"
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "enable_dns_support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "enable_dns_hostnames"
  type        = bool
  default     = true
}

variable "enable_classiclink" {
  description = "enable_classiclink"
  type        = bool
  default     = false
}

variable "enable_classiclink_dns_support" {
  description = "enable_classiclink_dns_support"
  type        = bool
  default     = false
}

variable "tags_vpc" {
  description = "tags_vpc"
  type        = map(string)
  default     = {}
}

variable "vpc_name" {
  description = "resource_name"
  type        = string
  default     = ""
}

# internet_gateway variables

variable "create_internet_gateway" {
  description = "Make it true to create internet_gateway"
  type        = bool
  default     = false
}

variable "tags_internet_gateway" {
  description = "tags_internet_gateway"
  type        = map(string)
  default     = {}
}

variable "internet_gateway_name" {
  description = "resource_name"
  type        = string
  default     = ""
}

# subnet common variables

variable "create_timeout_subnet" {
  description = "create_timeout_subnet"
  type        = string
  default     = "10m"
}

variable "delete_timeout_subnet" {
  description = "delete_timeout_subnet"
  type        = string
  default     = "20m"
}

# private_subnets variables

variable "create_private_subnets" {
  description = "Make it true to create private_subnets"
  type        = bool
  default     = false
}

variable "availability_zone_private" {
  description = "availability_zone"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "private_subnets"
  type        = list(string)
  default     = []
}

variable "tags_private_subnets" {
  description = "tags_private_subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnets_name" {
  description = "resource_name"
  type        = string
  default     = ""
}

# route_table common variables

variable "create_timeout_route" {
  description = "create_timeout_route"
  type        = string
  default     = "10m"
}

variable "delete_timeout_route" {
  description = "delete_timeout_route"
  type        = string
  default     = "20m"
}

# private_route_table variables

variable "create_private_route_table" {
  description = "Make it true to create private_route_table"
  type        = bool
  default     = false
}

variable "tags_private_route_table" {
  description = "tags_private_route_table"
  type        = map(string)
  default     = {}
}

variable "private_route_table_name" {
  description = "resource_name"
  type        = string
  default     = ""
}

# private_route variables

variable "create_private_route" {
  description = "Make it true to create public_route"
  type        = bool
  default     = false
}

# public_subnets variables

variable "create_public_subnets" {
  description = "Make it true to create public_subnets"
  type        = bool
  default     = false
}

variable "availability_zone_public" {
  description = "availability_zone"
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "public_subnets"
  type        = list(string)
  default     = []
}

variable "map_public_ip_on_launch_public" {
  description = "map_public_ip_on_launch_public"
  type        = bool
  default     = true
}

variable "tags_public_subnets" {
  description = "tags_public_subnets"
  type        = map(string)
  default     = {}
}

variable "public_subnets_name" {
  description = "resource_name"
  type        = string
  default     = ""
}

# public_route_table variables

variable "create_public_route_table" {
  description = "Make it true to create public_route_table"
  type        = bool
  default     = false
}

variable "tags_public_route_table" {
  description = "tags_public_route_table"
  type        = map(string)
  default     = {}
}

variable "public_route_table_name" {
  description = "resource_name"
  type        = string
  default     = ""
}

# public_route variables

variable "create_public_route" {
  description = "Make it true to create public_route"
  type        = bool
  default     = false
}

# eip variables

variable "create_eip" {
  description = "Make it true to create eip"
  type        = bool
  default     = false
}

variable "tags_eip" {
  description = "tags_eip"
  type        = map(string)
  default     = {}
}

variable "eip_name" {
  description = "resource_name"
  type        = string
  default     = ""
}

# nat_gateway variables

variable "create_nat_gateway" {
  description = "Make it true to create nat_gateway"
  type        = bool
  default     = false
}

variable "tags_nat_gateway" {
  description = "tags_nat_gateway"
  type        = map(string)
  default     = {}
}

variable "nat_gateway_name" {
  description = "resource_name"
  type        = string
  default     = ""
}

# default_security_group variables

variable "manage_default_security_group" {
  description = "Make it true to manage default_security_group"
  type        = bool
  default     = false
}

variable "default_security_group_ingress" {
  description = "List of maps of ingress rules to set on the default_security_group"
  type        = list(map(string))
  default     = null
}

variable "default_security_group_egress" {
  description = "List of maps of egress rules to set on the default_security_group"
  type        = list(map(string))
  default     = null
}

variable "tags_default_security_group" {
  description = "tags for default_security_group"
  type        = map(string)
  default     = {}
}

variable "default_security_group_name" {
  description = "resource_name"
  type        = string
  default     = ""
}

# default_route_table variables

variable "manage_default_route_table" {
  description = "Make it true to manage default_route_table"
  type        = bool
  default     = false
}

variable "default_route_table_routes" {
  description = "List of maps of routes to set on the default_route_table"
  type        = list(map(string))
  default     = null
}

variable "tags_default_route_table" {
  description = "tags for default_route_table"
  type        = map(string)
  default     = {}
}

variable "default_route_table_name" {
  description = "resource_name"
  type        = string
  default     = ""
}

# default_network_acl variables

variable "manage_default_network_acl" {
  description = "Make it true to manage default_network_acl"
  type        = bool
  default     = false
}

variable "default_network_acl_ingress" {
  description = "List of maps of ingress rules to set on the default_network_acl"
  type        = list(map(string))
  default     = null
}

variable "default_network_acl_egress" {
  description = "List of maps of egress rules to set on the default_network_acl"
  type        = list(map(string))
  default     = null
}

variable "tags_default_network_acl" {
  description = "tags for default_network_acl"
  type        = map(string)
  default     = {}
}

variable "default_network_acl_name" {
  description = "resource_name"
  type        = string
  default     = ""
}