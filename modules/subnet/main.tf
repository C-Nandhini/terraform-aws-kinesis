# create subnet

resource "aws_subnet" "main" {
  availability_zone               = var.availability_zone_subnet
  cidr_block                      = var.cidr_block_subnet
  customer_owned_ipv4_pool        = var.customer_owned_ipv4_pool
  map_customer_owned_ip_on_launch = var.map_customer_owned_ip_on_launch
  map_public_ip_on_launch         = var.map_public_ip_on_launch_subnet
  outpost_arn                     = var.outpost_arn
  vpc_id                          = var.vpc_id

  tags = merge(
    {
      Name                = var.name
      Environment         = var.environment
      Platform_IAC_Source = "terraform-aws-${var.repo_short_name}"
    },
    var.tags
  )

  timeouts {
    create = var.create_timeout_subnet
    delete = var.delete_timeout_subnet
  }
}
