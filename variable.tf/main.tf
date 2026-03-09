terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.35.1"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "Hello" {
  ami             = "ami-073130f74f5ffb161"
  instance_type   = var.aws_instance_type
  
  root_block_device {
    delete_on_termination = true
    volume_size = var.ec2_config.volume_size
    volume_type = var.ec2_config.volume_type
  }

  tags = merge(var.additional_tags, {
    Name = "Simple_server"
  })
  
}