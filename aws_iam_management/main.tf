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
  users_data = yamldecode(file("./users.yaml")).users

  user_role_pair = flatten([for user in local.users_data : [for role in user.roles : {
    username = user.username
    role = role
  }]])
}

output "output" {
  value = local.user_role_pair
}

#creating iam users
resource "aws_iam_user" "users" {
    for_each = toset(local.users_data[*].username)
    name = each.value
    }

#Password for the users
resource "aws_iam_user_login_profile" "profile" {
    for_each =aws_iam_user.users
    user = each.value.name
    password_length = 12

     lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }
}

#attaching policies to the users
resource "aws_iam_user_policy_attachment" "attachment" {
    for_each = {for pair in local.user_role_pair : "${pair.username}-${pair.role}" => pair
    }
    #Prince-AmazonS3FullAccess
    #Sumit-AmazonS3ReadOnlyAccess
    #Daksh-AmazonS3ReadOnlyAccess, Daksh-AmazonEC2ReadOnlyAccess
    user = aws_iam_user.users[each.value.username].name
    policy_arn = "arn:aws:iam::aws:policy/${each.value.role}"
}