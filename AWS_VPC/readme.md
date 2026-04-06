# AWS VPC + EC2 Infrastructure using Terraform

This project uses **Terraform** to create a basic AWS infrastructure setup, including:

* VPC (Virtual Private Cloud)
* Public and Private Subnets
* Internet Gateway
* Route Table
* EC2 Instance

---

## 📦 Prerequisites

Make sure you have the following installed:

* ✅ AWS Account
* ✅ AWS CLI (configured with `aws configure`)
* ✅ Terraform
* ✅ Git (optional, for version control)

---

## ⚙️ Project Structure

```
.
├── main.tf
└── README.md
```

---

## 🚀 What This Project Creates

### 1. VPC

* CIDR Block: `10.0.0.0/16`

### 2. Subnets

* Private Subnet: `10.0.1.0/24`
* Public Subnet: `10.0.2.0/24`

### 3. Internet Gateway

* Allows internet access for public subnet

### 4. Route Table

* Routes traffic (`0.0.0.0/0`) to Internet Gateway

### 5. EC2 Instance

* Instance Type: `t3.nano`
* Deployed in Public Subnet
* AMI: `ami-0f559c3642608c138`

---

## 🔧 Setup Instructions

### Step 1: Clone the Repository

```bash
git clone <your-repo-url>
cd <your-folder>
```

---

### Step 2: Initialize Terraform

```bash
terraform init
```

This will download required providers (AWS).

---

### Step 3: Validate Configuration

```bash
terraform validate
```

---

### Step 4: Preview Changes

```bash
terraform plan
```

---

### Step 5: Apply Configuration

```bash
terraform apply
```

Type `yes` when prompted.

---

## 🧹 Destroy Resources (Cleanup)

To delete all created resources:

```bash
terraform destroy
```

---

## ⚠️ Notes

* Ensure your AWS CLI is properly configured:

  ```bash
  aws configure
  ```
* The EC2 instance is created in a **public subnet**, but:

  * No security group is defined
  * No key pair is attached
    → You may not be able to SSH into it yet

---

## 💡 Improvements You Can Add

* Add **Security Group** (allow SSH/HTTP)
* Attach **Key Pair** for EC2 login
* Enable **Elastic IP**
* Add **NAT Gateway** for private subnet
* Use variables (`variables.tf`) for flexibility

---

## 📌 Author

Prince Singh Chauhan

---
