 module "vpc" {
   source      = "./modules/rename-me-to-primary-resource-example-vpc"

   cidr_block  = var.cidr_block
 }

 module "igw" {
    source      = "./modules/rename-me-to-secondary-resource-example-igw"

    vpc_id      = module.vpc[0].id
 }





