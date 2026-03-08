terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.35.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "random_id" "Rand_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "Test_Terraform" {
  bucket = "test-terraform-bucket-${random_id.Rand_id.hex}"
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.Test_Terraform.bucket
  source = "./myfile.txt"
  key    = "mydata.txt"
}


output "name" {
  value = random_id.Rand_id.dec
}