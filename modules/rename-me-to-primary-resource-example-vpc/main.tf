# Sample vpc resource creation

resource "aws_vpc" "main" {
  cidr_block                     = var.cidr_block
  instance_tenancy               = var.instance_tenancy
  enable_dns_support             = var.enable_dns_support
  enable_dns_hostnames           = var.enable_dns_hostnames
  enable_classiclink             = var.enable_classiclink
  enable_classiclink_dns_support = var.enable_classiclink_dns_support

  tags = merge(
    {
      Name                = var.name
      Environment         = var.environment
      Platform_IAC_Source = "terraform-aws-${var.repo_short_name}"
    },
    var.tags
    , {
      yor_trace = "47428677-afa1-4fc3-a40a-27cbd9279fa6"
  })
}