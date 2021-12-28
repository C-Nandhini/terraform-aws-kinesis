# Sample igw resource creation

resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      Name                = var.name
      Environment         = var.environment
      Platform_IAC_Source = "terraform-aws-${var.repo_short_name}"
    },
    var.tags
    , {
      yor_trace = "0ec0fe90-1890-454b-b26d-0ba9d8bcbe5c"
  })
}