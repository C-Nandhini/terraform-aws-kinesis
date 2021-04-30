#create network_acl

resource "aws_network_acl" "main" {
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  tags = merge(
    {
      Name                = var.name
      Environment         = var.environment
      Platform_IAC_Source = "terraform-aws-${var.repo_short_name}"
    },
    var.tags
  )
}
