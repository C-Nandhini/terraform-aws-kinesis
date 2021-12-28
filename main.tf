#  module "vpc" {
#    source      = "./modules/rename-me-to-primary-resource-example-vpc"

#    cidr_block  = var.cidr_block
#  }

#  module "igw" {
#     source      = "./modules/rename-me-to-secondary-resource-example-igw"

#     vpc_id      = module.vpc.id
#  }

// Configure Terraform Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

// Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

locals {
  policy = <<EOL
{
   "Version": "2012-10-17",
   "Id": "Policy1415115909152",
   "Statement": [
     {
       "Sid": "Access-to-specific-VPCE-only",
       "Principal": "*",
       "Action": "s3:*",
       "Effect": "Deny",
       "Resource": "*"
       "Condition": {
         "StringNotEquals": {
           "aws:SourceVpce": "vpce-1a2b3c4d"
         }
       }
     },
     {
       "Sid": "Access-to-specific-VPCE-only",
       "Principal": "*",
       "Action": "s3:*",
       "Effect": "Allow",
       "Resource": "*"
       "Condition": {
         "StringEquals": {
           "aws:SourceVpce": "vpce-1a2b3c4d"
         }
       }
     },
   ]
}
EOL
}

resource "aws_s3_bucket" "sample" {
  bucket = "sample-${random_integer.random.id}"
  acl    = "private"
  policy = local.policy
}


resource "aws_s3_bucket" "sample1" {
  bucket = "sample1-${random_integer.random.id}"
}

resource "aws_s3_bucket_policy" "sample1_policy" {
  bucket = aws_s3_bucket.sample1.id
  policy = local.policy
}

resource "random_integer" "random" {
  min = 1
  max = 99999999
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






