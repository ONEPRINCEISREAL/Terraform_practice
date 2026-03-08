terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.1"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "my_server" {
  ami           = "ami-0f559c3642608c138"
  instance_type = "t3.nano"
    tags = {
        Name = "my_server"
    }
}

