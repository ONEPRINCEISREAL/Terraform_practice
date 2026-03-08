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

data "aws_ami" "name" {
    most_recent = true
    owners = [ "amazon" ]
    }

output "aws_ami" {
  value = data.aws_ami.name.id
} 

resource "aws_instance" "my_server" {
  ami           = data.aws_ami.name.id
  instance_type = "t3.nano"
    tags = {
        Name = "my_server"
    }
}


