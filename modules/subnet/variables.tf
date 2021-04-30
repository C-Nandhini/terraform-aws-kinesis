# timeout variables

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

# subnet variables

variable "availability_zone_subnet" {
  description = "availability_zone_subnet"
  type        = string
  default     = ""
}

variable "cidr_block_subnet" {
  description = "cidr_block_subnet"
  type        = string
  default     = ""
}

variable "customer_owned_ipv4_pool" {
  description = "customer_owned_ipv4_pool"
  type        = string
  default     = ""
}

variable "map_customer_owned_ip_on_launch" {
  description = "map_customer_owned_ip_on_launch"
  type        = bool
  default     = false
}

variable "map_public_ip_on_launch_subnet" {
  description = "map_public_ip_on_launch_subnet"
  type        = bool
  default     = false
}

variable "outpost_arn" {
  description = "outpost_arn"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "vpc_id"
  type        = string
}

variable "tags" {
  description = "tags"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "resource_name"
  type        = string
  default     = ""
}

variable "environment" {
  description = "environment_name"
  type        = string
  default     = ""
}

variable "repo_short_name" {
  description = "repo_short_name"
  type        = string
  default     = "vpc"
}