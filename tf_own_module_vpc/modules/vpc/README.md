# terraform_aws_vpc

## Overview

This Terraform module creates an AWS VPC with a specified CIDR block and dynamically provisions multiple subnets (public and private) based on user input.

For public subnets, the module automatically:

* Creates an Internet Gateway (IGW)
* Enables auto-assign public IP
* Creates and associates a Public Route Table with a default route to the Internet

For private subnets, the module:

* Creates a separate Private Route Table
* Associates private subnets with the private route table (no internet access by default)

This module is designed to be **simple, reusable, and modular**, making it suitable for learning Terraform modules as well as real DevOps project structures.

---

## Features

* Creates a VPC with a specified CIDR block
* Dynamically creates multiple subnets using `for_each`
* Supports both **Public and Private subnets**
* Automatically enables **Public IP assignment for Public subnets**
* Creates **Internet Gateway (IGW)** when at least one public subnet is present
* Creates separate **Public and Private Route Tables**
* Automatically associates route tables with correct subnets
* Uses **input validation for CIDR blocks**
* Tagging support for better AWS resource identification

---

## Usage

```hcl
provider "aws" {
  region = "eu-north-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "my-test-vpc"
  }

  subnet_config = {
    public_subnet_1 = {
      cidr_block        = "10.0.0.0/24"
      availability_zone = "eu-north-1a"
      public            = true
    }

    public_subnet_2 = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "eu-north-1b"
      public            = true
    }

    private_subnet_1 = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "eu-north-1c"
    }
  }
}
```

---

## Input Variables

### vpc_config

| Name       | Type   | Description            |
| ---------- | ------ | ---------------------- |
| name       | string | Name tag for the VPC   |
| cidr_block | string | CIDR block for the VPC |

---

### subnet_config

Map of subnet objects.

| Name              | Type            | Description                              |
| ----------------- | --------------- | ---------------------------------------- |
| cidr_block        | string          | CIDR block of the subnet                 |
| availability_zone | string          | AWS Availability Zone                    |
| public            | bool (optional) | Marks subnet as public (default = false) |

---

## Architecture Created

```
VPC
 ├── Public Subnet(s)
 │     ├── Auto Public IP Enabled
 │     ├── Associated with Public Route Table
 │     └── Route → Internet Gateway
 │
 └── Private Subnet(s)
       └── Associated with Private Route Table (No Internet by default)
```

---

## Requirements

* Terraform >= 1.0
* AWS Provider >= 6.35

---

## Future Improvements

* NAT Gateway for private subnet internet access
* Elastic IP automation
* Outputs for subnet IDs, VPC ID, route table IDs
* Multi-AZ automatic distribution
* Production tagging standards
* Support for VPC Flow Logs
* Optional NAT per AZ architecture

---

## Author

Prince Singh Chauhan
Terraform Practice Project 
