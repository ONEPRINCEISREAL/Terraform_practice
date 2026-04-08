# 🚀 Terraform AWS IAM Users (YAML-based)

This project uses **Terraform** to create IAM users, assign roles, and generate login profiles from a YAML file.

---

## 📁 Files

```
main.tf
users.yaml
```

---

## 🧾 users.yaml

```yaml
users:
  - username: Prince
    roles:
      - AmazonS3FullAccess
```

---

## ⚙️ Prerequisites

* Terraform
* AWS CLI
* AWS credentials configured

---

## ▶️ Usage

```bash
terraform init
terraform plan
terraform apply
```

---

## 💡 What It Does

* Creates IAM users
* Assigns policies (roles)
* Generates login passwords
* Uses YAML for easy management

---

## 🧹 Cleanup

```bash
terraform destroy
```

