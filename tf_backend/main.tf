terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.1"
    }
  }
  backend "s3" {
        bucket = "test-terraform-bucket-f5fe24fc12e0f0c2"
        key    = "backend.tfstate"
        region = "ap-south-1"
    } 
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_server" {
  ami           = "ami-0f559c3642608c138"
  instance_type = "t3.nano"
    tags = {
        Name = "my_server"
    }
}