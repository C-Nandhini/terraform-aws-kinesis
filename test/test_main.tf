# Setup for Terraform
terraform {
  required_version = ">=0.14.5"
}
provider "aws" {
  region = "us-east-1"
}
module "vpc" {
# CONSUME VPC MODULE FROM INNERSOURCE IAC FOR TEST
source = "../"

environment = "Test"
vpc_name = "carbon-vpc"
internet_gateway_name = "carbon-igw"
private_subnets_name = "carbon-private_subnets"
public_subnets_name = "carbon-public_subnets"
private_route_table_name = "carbon-private_route_table"
public_route_table_name = "carbon-public_route_table"
eip_name = "carbon-eip"
nat_gateway_name = "carbon-nat"
cidr_block = "10.0.0.0/16"
create_internet_gateway = true
create_private_subnets = true
private_subnets = ["10.0.0.0/26", "10.0.0.64/26"]
availability_zone_private = ["us-east-1a", "us-east-1b"]
create_private_route_table = true
create_private_route = true
create_public_subnets = true
public_subnets =  ["10.0.0.128/26", "10.0.0.192/26"]
availability_zone_public = ["us-east-1a", "us-east-1b"]
create_public_route_table = true
create_public_route = true
create_eip = true
create_nat_gateway = true
manage_default_security_group = true
default_security_group_name = "carbon-default-sg"
default_security_group_ingress = [
  {
    cidr_blocks = "192.168.0.0/24"
    protocol = "tcp"
    to_port = 22
    description = "ssh"
  },
  {
    cidr_blocks = "192.168.0.0/24"
    protocol = "tcp"
    to_port = 3389
    description = "rdp"
  }
]
default_security_group_egress = [
  {
    cidr_blocks = "0.0.0.0/0"
    protocol = -1
    description = "outbound all rule"
  }
]
manage_default_network_acl = true
default_network_acl_name = "carbon-default-nacl"
default_network_acl_ingress = [
  {
    action = "deny"
    rule_no = 100
    cidr_block = "0.0.0.0/0"
    protocol = "tcp"
    to_port = 22
    from_port = 22
  }
]
default_network_acl_egress = [
  {
    action = "allow"
    rule_no = 200
    cidr_block = "0.0.0.0/0"
    protocol = -1
    to_port = 0
    from_port = 0
  }
]
}
