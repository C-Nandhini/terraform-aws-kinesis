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

resource "random_integer" "random" {
  min = 1
  max = 99999999
}

resource "aws_ssm_parameter" "aws_ssm_parameter_ok" {
 name            = "sample"
 type            = "SecureString"
 value           = "test"
 description     = "policy test"
 tier            = "Standard"
 allowed_pattern = ".*"
 data_type       = "text"
}

resource "aws_ssm_parameter" "aws_ssm_parameter_not_ok" {
 name            = "sample"
 type            = "String"
 value           = "test"
 description     = "policy test"
 tier            = "Standard"
 allowed_pattern = ".*"
 data_type       = "text"
}

resource "aws_db_instance" "aws_db_instance_ok" {
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  name                    = "mydb"
  username                = "foo"
  password                = "foobarbaz"
  parameter_group_name    = "default.mysql5.7"
  skip_final_snapshot     = true
  backup_retention_period = 8
}

resource "aws_db_instance" "aws_db_instance_not_ok" {
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  name                    = "mydb"
  username                = "foo"
  password                = "foobarbaz"
  parameter_group_name    = "default.mysql5.7"
  skip_final_snapshot     = true
  backup_retention_period = 1
}

resource "aws_db_instance" "aws_db_instance_ok" {
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  name                    = "mydb"
  username                = "foo"
  password                = "foobarbaz"
  parameter_group_name    = "default.mysql5.7"
  skip_final_snapshot     = true
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
}

resource "aws_instance" "example" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
  associate_public_ip_address = true

  credit_specification {
    cpu_credits = "unlimited"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id
}

resource "aws_route_table" "aws_route_table_ok" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }
}

resource "aws_route_table" "aws_route_table_not_ok" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    instance_id = aws_instance.example.id
  }
}

resource "aws_route" "aws_route_ok" {
  route_table_id            = aws_route_table.example.id
  destination_cidr_block    = "10.0.1.0/24"
  gateway_id                = aws_internet_gateway.example.id
}

resource "aws_route" "aws_route_not_ok" {
  route_table_id            = aws_route_table.example.id
  destination_cidr_block    = "0.0.0.0/0"
  instance_id               = aws_instance.example.id
}
