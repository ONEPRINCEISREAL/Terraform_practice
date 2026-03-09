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

data "aws_ami" "name" {
  most_recent = true
  owners      = ["amazon"]
}

output "aws_ami" {
  value = data.aws_ami.name.id
}

#Security group
data "aws_security_group" "name" {
  tags = {
    name = "mysg"
    ENV  = "PROD"
  }
}

output "security_group_id" {
  value = data.aws_security_group.name.id
}

#VPC Id
data "aws_vpc" "my-vpc" {
  tags = {
    ENV  = "PROD"
    Name = "my-vpc"
  }
}

output "vpc_id" {
  value = data.aws_vpc.my-vpc.id
}

#AZ 
data "aws_availability_zones" "names" {
  state = "available"
}
 output "aws_availability_zones" {
  value = data.aws_availability_zones.names
}

#Subnet ID
data "aws_subnet" "name" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.my-vpc.id]
  }
  tags = {
    Name = "private-subnet"
    ENV  = "PROD"
  }
}

resource "aws_instance" "myserver" {
  ami             = "ami-0aaa636894689fa47"
  instance_type   = "t3.nano"
  subnet_id       = data.aws_subnet.name.id
  security_groups = [data.aws_security_group.name.id]

  tags = {
    Name = "SampleServer"
  }
}
