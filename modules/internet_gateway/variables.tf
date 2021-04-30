# internet_gateway variables

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
