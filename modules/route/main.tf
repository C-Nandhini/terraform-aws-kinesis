# create route
resource "aws_route" "main" {
  route_table_id            = var.route_table_id
  destination_cidr_block    = var.destination_cidr_block
  gateway_id                = var.gateway_id
  instance_id               = var.instance_id
  nat_gateway_id            = var.nat_gateway_id
  transit_gateway_id        = var.transit_gateway_id
  local_gateway_id          = var.local_gateway_id
  network_interface_id      = var.network_interface_id
  vpc_endpoint_id           = var.vpc_endpoint_id
  vpc_peering_connection_id = var.vpc_peering_connection_id

  timeouts {
    create = var.create_timeout_route
    delete = var.delete_timeout_route
  }
}
