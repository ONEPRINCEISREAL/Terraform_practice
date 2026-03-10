terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.1"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

locals {
  project = "project"
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {Name = "${local.project}-vpc"
    }
}

resource "aws_subnet" "my_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.${count.index}.0/24"
    count = 2
    tags = {Name = "${local.project}-subnet-${count.index + 1}"
    }
}

#creating 4 ec2 instances
resource "aws_instance" "my_instance" {
  for_each = var.ec2_map # we can use for each instead of count when we have map variable
  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id = element(aws_subnet.my_subnet[*].id, each.key == "ubuntu" ? 0 : 1)# we can use element function to assign subnet id based on the key of the map variable
  # count         = length(var.ec2_config) 
  # subnet_id     = element(aws_subnet.my_subnet[*].id, count.index % length(aws_subnet.my_subnet))
  # #0%2=0
  #1%2=1 
  #2%2=0 
  #3%2=1
  tags = {
    Name = "${local.project}-instance-${each.key}"
  }
}

output "aws_subnet_ids" {
  value = aws_subnet.my_subnet[*].id
}

