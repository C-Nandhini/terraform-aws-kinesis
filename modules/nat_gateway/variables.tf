# nat_gateway variables

variable "allocation_id" {
  description = "allocation_id"
  type        = string
}

variable "subnet_id" {
  description = "subnet_id"
  type        = string
}

variable "tags" {
  description = "vpc_tags"
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
