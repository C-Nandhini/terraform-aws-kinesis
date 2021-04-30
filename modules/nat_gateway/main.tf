# create nat_gateway
resource "aws_nat_gateway" "main" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id

  tags = merge(
    {
      Name                = var.name
      Environment         = var.environment
      Platform_IAC_Source = "terraform-aws-${var.repo_short_name}"
    },
    var.tags
  )
}
