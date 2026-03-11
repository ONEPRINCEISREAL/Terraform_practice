# 🚀 Terraform Practice Repository

Welcome to my **Terraform Practice Repository**.

This repository contains multiple hands-on Terraform projects that I created while learning and practicing **Infrastructure as Code (IaC) using Terraform on AWS.**

If you want to **learn Terraform from beginner to intermediate level**, you can follow or refer to this repository.

---

## 📚 About This Repository

This repo includes real Terraform practice projects such as:

* VPC creation and networking
* EC2 provisioning
* IAM management
* S3 bucket creation
* Terraform backend configuration
* Terraform modules (reusable infrastructure)
* Functions, variables and loops practice
* Static website deployment
* Multi-resource architecture examples

Each folder represents a **separate Terraform concept or project.**

---

## 🧠 Who Can Use This?

This repository is helpful for:

* Beginners learning Terraform
* Students preparing for DevOps / Cloud interviews
* Engineers who want real Terraform module examples
* Anyone who wants AWS infrastructure automation examples

---

## 📂 Project Structure

```id="repo01"
Terraform_practice/
│
├── AWS_VPC
├── aws_ec2
├── aws_iam_management
├── aws_s3
├── aws_vpc_ec2_nginx
├── project_static_website
├── tf_backend
├── tf_data_sources
├── tf_functions
├── tf_module_vpc
├── tf_multi_resource
├── tf_operators-exps
├── tf_own_module_vpc
```

---

## ⚙️ Prerequisites

Before using these projects make sure you have:

* Terraform installed (>= 1.0)
* AWS CLI configured
* AWS account with proper IAM permissions

---

## ▶️ How to Use Any Project

Go inside any project folder and run:

```bash id="repo02"
terraform init
terraform plan
terraform apply
```

To destroy resources:

```bash id="repo03"
terraform destroy
```

---

## 🎯 Learning Path Suggestion

If you are new to Terraform, follow this order:

1. Variables and Functions (`tf_functions`, `tf_operators-exps`)
2. Basic Resources (`aws_s3`, `aws_ec2`)
3. Networking (`AWS_VPC`)
4. Modules (`tf_module_vpc`, `tf_own_module_vpc`)
5. Backend & State Management (`tf_backend`)
6. Real Projects (`project_static_website`, `aws_vpc_ec2_nginx`)

---

## ⭐ Support

If this repository helps you learn Terraform:

* ⭐ Star the repository
* 🍴 Fork it
* 👀 Follow for more DevOps / Cloud projects

---

## 👨‍💻 Author

**Prince Singh Chauhan**
Terraform & Cloud Practice Projects
