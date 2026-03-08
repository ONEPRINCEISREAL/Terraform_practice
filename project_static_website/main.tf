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

resource "aws_s3_bucket" "Test_Terraform_website" {
  bucket = "mywebsite-terraform-bucket-${random_id.Rand_id.hex}"
}

resource "aws_s3_bucket_public_access_block" "name" {
  bucket = aws_s3_bucket.Test_Terraform_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false   
}

resource "aws_s3_bucket_policy" "mywebapp" {
    bucket = aws_s3_bucket.Test_Terraform_website.id
    
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect = "Allow"
            Principal = "*"
            Action = "s3:GetObject"
            Resource = "${aws_s3_bucket.Test_Terraform_website.arn}/*"
        }
        ]
    })  
}

resource "aws_s3_bucket_website_configuration" "mywebapp" {
    bucket = aws_s3_bucket.Test_Terraform_website.id

    index_document {
        suffix = "index.html"
    }
  
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.Test_Terraform_website.bucket
  source = "./index.html"
  key    = "index.html"
  content_type = "text/html"
} 

resource "aws_s3_object" "Style_css" {
  bucket = aws_s3_bucket.Test_Terraform_website.bucket
  source = "./style.css"
  key    = "style.css"
  content_type = "text/css"
} 



output "name" {
  value = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
} 