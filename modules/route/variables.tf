# route variables

variable "route_table_id" {
  description = "route_table_id"
  type        = string
}

variable "destination_cidr_block" {
  description = "destination_cidr_block"
  type        = string
}

variable "gateway_id" {
  description = "gateway_id"
  type        = string
  default     = null
}

variable "instance_id" {
  description = "instance_id"
  type        = string
  default     = null
}

variable "nat_gateway_id" {
  description = "nat_gateway_id"
  type        = string
  default     = null
}

variable "local_gateway_id" {
  description = "local_gateway_id"
  type        = string
  default     = null
}

variable "network_interface_id" {
  description = "network_interface_id"
  type        = string
  default     = null
}

variable "transit_gateway_id" {
  description = "transit_gateway_id"
  type        = string
  default     = null
}

variable "vpc_endpoint_id" {
  description = "vpc_endpoint_id"
  type        = string
  default     = null
}

variable "vpc_peering_connection_id" {
  description = "vpc_peering_connection_id"
  type        = string
  default     = null
}

variable "create_timeout_route" {
  description = "route creation timeout"
  type        = string
  default     = "2m"
}

variable "delete_timeout_route" {
  description = "route deletion timeout"
  type        = string
  default     = "5m"
}
