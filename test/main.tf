#Provide Required Module for Testing

# Setup for Terraform & AWS Provider
terraform {
  required_version = ">=0.14.5"
}

provider "aws" {
  region = "us-east-1"
}

# Source code to test 

module "test" {
  source = "../"
  cidr_block = "10.0.0.0/16"
}