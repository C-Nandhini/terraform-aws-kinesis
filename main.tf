 module "vpc" {
   source      = "./modules/rename-me-to-primary-resource-example-vpc"

   cidr_block  = var.cidr_block
 }

 module "igw" {
    source      = "./modules/rename-me-to-secondary-resource-example-igw"

    vpc_id      = module.vpc.id
 }

 resource "aws_ssm_parameter" "sample" {
  name            = "sample"
  type            = "String"
  value           = "test"
  description     = "policy test"
  tier            = "Standard"
  allowed_pattern = ".*"
  data_type       = "text"
  tags            = {
    created_for = "BC Policy Test"
  }
}






