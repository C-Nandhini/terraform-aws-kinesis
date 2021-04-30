# vpc variables

variable "cidr_block" {
  description = "cidr_block"
  type        = string
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
