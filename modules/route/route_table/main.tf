#create route_table 

resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      Name                = var.name
      Environment         = var.environment
      Platform_IAC_Source = "terraform-aws-${var.repo_short_name}"
    },
    var.tags
  )
}
