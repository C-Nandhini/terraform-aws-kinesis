[![End to End Testing](https://github.com/C-Nandhini/terraform-test/actions/workflows/E2ETesting.yml/badge.svg?branch=main)](https://github.com/C-Nandhini/terraform-test/actions/workflows/E2ETesting.yml)

## AWS VPC Terraform Reusable Modules
#### Terraform VPC Documentation - [VPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc/)
### Versions<br />
##### Terraform Version - 0.14+
##### AWS Provider Version - 3.0+
### Description<br />
##### The following resources will be implemented based on the creation flags,<br />
  ##### 1.  VPC<br />
  ##### 2.  Internet Gateway<br />
  ##### 3.  Private Subnets<br />
  ##### 4.  Route Table for Private Subets with route via NAT Gateway<br />
  ##### 5.  Public Subnets
  ##### 6.  Route Table for Public Subets with route via Internet Gateway<br />
  ##### 7.  Single EIP for one of the Public Subnets<br />
  ##### 8.  Single NAT Gateway<br />
  ##### 9.  Manage Default Security Group<br />
  ##### 10. Manage Default Route Table<br />
  ##### 11. Manage Default Network ACL<br />
### Usage<br />
```t
module "vpc_setup" {
  source = "git@github.com:sede-x/terraform-aws-vpc.git"

  # create vpc only
  cidr_block = "10.0.0.0/16"
  vpc_name = "project-test-vpc"

  # create internet_gateway
  create_internet_gateway = true
  internet_gateway_name = "project-test-igw"

  #create private_subnets
  create_private_subnets = true
  private_subnets = ["10.0.0.0/26", "10.0.0.64/26"]
  availability_zone_private = ["us-east-1a", "us-east-1b"]
  }
  private_subnets_name = "project-test-private_subnets"

  #create route table and association for private subnet
  create_private_route_table = true
  private_route_table_name = "project-test-private_route_table"
 
  #create route for private subnets to nat gateway
  create_private_route = true

  #create public_subnets
  create_public_subnets = true
  public_subnets =  ["10.0.0.128/26", "10.0.0.192/26"]
  availability_zone_public = ["us-east-1a", "us-east-1b"]
  public_subnets_name = "project-test-public_subnets"

  #create route table and association for private subnet
  create_public_route_table = true
  public_route_table_name = "project-test-public_route_table"

  #create route for public subnets to internet gateway
  create_public_route = true

  #create an eip for nat gateway
  create_eip = true
  eip_name = "project-test-eip"
  
  #create single nat gateway
  create_nat_gateway = true
  nat_gateway_name = "project-test-nat"

  #manage default security group
  manage_default_security_group = true
  default_security_group_name = "project-test-default-sg"
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

  #manage default route table
  manage_default_route_table = true
  default_route_table_name = "project-test-default-route-table"
  default_route_table_routes = [
    {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-08b9f0f06bfb5de33"
    }
  ]

  #manage default network acl
  manage_default_network_acl = true
  default_network_acl_name = "project-test-default-nacl"
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
```
### Input Variables
| Name | Description | Type | Default Value | Required | Allowed |
|-|-|-|-|-|-|
|**VPC**|
| cidr_block | CIDR block for VPC | string | null | Yes | Valid IPv4 CIDR |
| instance_tenancy | Instance Tenancy Option | string | default | No | host/dedicated |
| enable_dns_support | enable/disable DNS support | bool | true | No | true/false |
| enable_dns_hostnames | enable/disable DNS hostnames | bool | true | No | true/false |
| enable_classiclink | enable/disable ClassicLink | bool | false | No | true/false |
| enable_classiclink_dns_support | enable/disable ClassicLink DNS Support | bool | false | No | true/false |
| tags_vpc | VPC Tags | map(string) | null | No | Valid map of strings |
| vpc_name |  Name Tag for VPC | string | null | No | Valid String |
|**Internet Gateway**|
| create_internet_gateway | IGW Creation Flag | bool | false | No | true/false |
| tags_internet_gateway | IGW Tags | map(string) | null | No | Valid map of strings |
| internet_gateway_name |  Name Tag for IGW | string | null | No | Valid String |
|**Private Subnets**|
| create_private_subnets | Private Subnets Creation Flag | bool | false | No | true/false |
| availability_zone_private | Availability zone | list(string) | null | Yes | Valid AZs |
| private_subnets | CIDR block of Subnets | list(string) | null | Yes | Valid IPv4 CIDR|
| tags_private_subnets | Private Subnets Tags | map(string) | null | No | Valid map of strings |
| private_subnets_name |  Name Tag for private_subnets | string | null | No | Valid String |
|**Public Subnets**|
| create_public_subnets | Public Subnets Creation Flag | bool | false | No | true/false |
| availability_zone_public | Availability zone | list(string) | null | Yes | Valid AZs |
| public_subnets | CIDR block of Subnets | list(string) | null | Yes | Valid IPv4 CIDR|
| map_public_ip_on_launch_public | public IP addresses on instance launch | bool | true | No | true |
| tags_public_subnets | Public Subnets Tags | map(string) | null | No | Valid map of strings |
| public_subnets_name |  Name Tag for public_subnets | string | null | No | Valid String |
|**Private Route Table**|
| create_private_route_table | Private Route Table Creation Flag | bool | false | No | true/false |
| tags_private_route_table | Private Route Table Tags | map(string) | null | No | Valid map of strings |
| private_route_table_name |  Name Tag for private_route_table | string | null | No | Valid String |
|**Private Route**|
| create_private_route | Private Route Creation Flag | bool | false | No | true/false |
|**Public Route Table**|
| create_public_route_table | Public Route Table Creation Flag | bool | false | No | true/false |
| tags_public_route_table | Public Route Table Tags | map(string) | null | No | Valid map of strings |
| public_route_table_name |  Name Tag for public_route_table | string | null | No | Valid String |
|**Public Route**|
| create_private_route | Public Route Creation Flag | bool | false | No | true/false |
|**EIP**|
| create_eip | EIP Creation Flag | bool | false | No | true/false |
| tags_eip | EIP Tags | map(string) | null | No | Valid map of strings |
| eip_name |  Name Tag for eip | string | null | No | Valid String |
|**Nat Gateway**|
| create_nat_gateway | NAT Gateway Creation Flag | bool | false | No | true/false |
| tags_nat_gateway | NAT Gateway Tags | map(string) | null | No | Valid map of strings |
| nat_gateway_name |  Name Tag for nat_gateway | string | null | No | Valid String |
|**Default Security Group**|
| manage_default_security_group | Default Security Group Flag | bool | false | No | true/false |
| default_security_group_ingress | List of maps of ingress rules | list(map(string)) | null | Yes | <pre>self = self/null</pre><pre>cidr_blocks = null/Valid IPv4 CIDR</pre><pre>security_groups = null/Valid Security Group ID</pre><pre>description = null/Valid Description</pre><pre>from_port = 0/Valid Port Number</pre><pre>to_port = 0/Valid Port Number</pre><pre>protocol = -1/Valid Protocol</pre> |
| default_security_group_egress | List of maps of egress rules | list(map(string)) | null | Yes | <pre>self = self/null</pre><pre>cidr_blocks = null/Valid IPv4 CIDR</pre><pre>security_groups = null/Valid Security Group ID</pre><pre>description = null/Valid Description</pre><pre>from_port = 0/Valid Port Number</pre><pre>to_port = 0/Valid Port Number</pre><pre>protocol = -1/Valid Protocol</pre> |
| tags_default_security_group | Default Security Group Tags | map(string) | null | No | Valid map of strings |
| default_security_group_name |  Name Tag for default_security_group | string | null | No | Valid String |
|**Default Route Table**|
| manage_default_route_table | Default Route Table Flag | bool | false | No | true/false |
| default_route_table_routes | List of maps of routes | list(map(string)) | No | Yes | <pre># One of the following destinations must be provided</pre><pre>cidr_block = Valid IPv4 CIDR</pre><pre># One of the following targets must be provided</pre><pre>gateway_id = Valid IGW ID</pre><pre>instance_id = Valid Instance ID</pre><pre>nat_gateway_id = Valid NAT Gateway ID</pre><pre>network_interface_id = Valid Network Interface ID</pre><pre>transit_gateway_id = Valid Transit Gateway ID</pre><pre>vpc_endpoint_id = Valid VPC Endpoint ID</pre><pre>vpc_peering_connection_id = Valid VPC Peering Connection ID</pre> |
| tags_default_route_table | Default Route Table Tags | map(string) | null | No | Valid map of strings |
| default_route_table_name |  Name Tag for default_route_table | string | null | No | Valid String |
|**Default Network ACL**|
| manage_default_network_acl | Default Network ACL Flag | bool | false | No | true/false |
| default_network_acl_ingress | List of maps of ingress rules | list(map(string)) | No | Yes | <pre>action = allow/deny</pre><pre>cidr_block = nullorValid IPv4 CIDR</pre><pre>rule_no = Valid Rule Number</pre><pre>from_port = Valid Port Number</pre><pre>to_port = Valid Port Number</pre><pre>protocol = Valid Protocol</pre><pre>icmp_code = null/Valid ICMP code</pre><pre>icmp_type = null/Valid ICMP Type</pre> |
| default_network_acl_egress | List of maps of egress rules | list(map(string)) | No | Yes | <pre>action = allow/deny</pre><pre>cidr_block = nullorValid IPv4 CIDR</pre><pre>rule_no = Valid Rule Number</pre><pre>from_port = Valid Port Number</pre><pre>to_port = Valid Port Number</pre><pre>protocol = Valid Protocol</pre><pre>icmp_code = null/Valid ICMP code</pre><pre>icmp_type = null/Valid ICMP Type</pre> |
| tags_default_network_acl | Default NACL Tags | map(string) | null | No | Valid map of strings |
| default_network_acl_name |  Name Tag for default_network_acl | string | null | No | Valid String |
|**Timeouts**|
| create_timeout_subnet | timeout for subnet creation | string | 10m | No | Valid Time String |
| delete_timeout_subnet | timeout for subnet deletion | string | 20m | No | Valid Time String |
| create_timeout_route | timeout for route creation | string | 2m | No | Valid Time String |
| create_timeout_route | timeout for route deletion | string | 5m | No | Valid Time String |
|**Common Tag**|
| tags | Common Tags for all resources | map(string) | null | No | Valid map of strings|
| environment | Common environment tag for all the resources | string | null | No | Valid String |

### Output Variables
| Name | Description |
|-|-|
| vpc_arn | VPC ARN|
| vpc_id | VPC ID |
| vpc_cidr_block | VPC CIDR Block |
| instance_tenancy | Instance Tenancy |
| enable_dns_support | VPC DNS support status |
| enable_dns_hostnames | VPC DNS hostnames status |
| enable_classiclink | VPC Classiclink status |
| main_route_table_id | Main Route Table ID |
| default_network_acl_id | Default Network ACL ID |
| default_security_group_id | Default Security Group ID |
| default_route_table_id | Default Route Table ID |
| owner_id | AWS Account Owner ID |
| internet_gateway_arn | Internet Gateway ARN |
| internet_gateway_id | Internet Gateway ID |
| private_subnets_arn | Private Subnets ARN |
| private_subnets_id | Private Subnets ID |
| private_route_table_id | Private Route Table ID |
| private_route_table_association_id | Private Route Table Association ID |
| public_subnets_arn | Public Subnets ARN |
| public_subnets_id | Public Subnets ID |
| public_route_table_id | Public Route Table ID |
| public_route_table_association_id | Public Route Table Association ID |
| eip_id | Elastic IP ID |
| nat_gateway_id | NAT Gateway ID |
| default_security_group_arn | Default Security Group ARN |
| default_security_group_name | Default Security Group Name |
| default_security_group_description | Default Security Group Description |
| default_network_acl_arn | Default Network ACL ARN |
