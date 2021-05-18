# igw example variables

variable "vpc_id" {
  description = "vpc_id"
  type        = string
}

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
  description = "deployment environment"
  type        = string
  default     = "regression-test"
}

variable "name" {
  description = "name of the resource"
  type        = string
  default     = "regression-test-vpc"
}