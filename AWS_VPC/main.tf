terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.1"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
} 

#create a vpc
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my_vpc"
    }
} 

#private subnet
resource "aws_subnet" "private_subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "private_subnet"
    }
} 

#public subnet
resource "aws_subnet" "public_subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id  = aws_vpc.my_vpc.id
    tags = {
        Name = "public_subnet"
    }
} 

#internet gateway
resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "my_igw"
    }
}

#route table
resource "aws_route_table" "my_route_table" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
}

resource "aws_route_table_association" "public_route_table" {
    route_table_id = aws_route_table.my_route_table.id
    subnet_id = aws_subnet.public_subnet.id  
}