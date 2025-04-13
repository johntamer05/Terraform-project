# Terraform AWS Modular Infrastructure

## 🚀 Project Overview

This project builds a modular and scalable infrastructure on AWS using Terraform. It provisions a complete setup including:

- VPC and subnets across 2 Availability Zones
- Internet Gateway and NAT Gateway
- Public and Private EC2 instances (with Apache and NGINX)
- Public and Private Load Balancers
- Security groups, route tables, and remote SSH access via Bastion Host
- Remote backend for storing Terraform state
- Fully modularized structure using reusable components

## 📁 Folder Structure

```bash
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── modules/
│   ├── vpc/
│   ├── subnets/
│   ├── gateways/
│   ├── ec2/
│   ├── loadbalancers/
│   ├── route_tables/
│   └── security_groups/
```

## 🌐 Network Architecture

- **VPC CIDR:** `10.0.0.0/16`
- **AZs:** 2 (AZ1 & AZ2)
- **Subnets:**
  - AZ1: Public `10.0.0.0/24`, Private `10.0.1.0/24`
  - AZ2: Public `10.0.2.0/24`, Private `10.0.3.0/24`
- **Instances:** 4 EC2 (2 Public, 2 Private)
- **Load Balancers:**
  - Public LB: Internet-facing, connected to 2 public EC2s
  - Private LB: Internal-only, connected to all 4 EC2s

## 🔐 Security & Access

- Bastion Host for accessing private instances via SSH
- Security groups for EC2s, Load Balancers, and Gateways
- Key pairs used for SSH access
- Apache and NGINX installed via `remote-exec`

## 🛠️ How to Use

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Select Workspace (Optional)
```bash
terraform workspace new dev
terraform workspace select dev
```

### 3. Plan the Deployment
```bash
terraform plan
```

### 4. Apply Changes
```bash
terraform apply
```

### 5. Output IPs
All EC2 public/private IPs are logged to a file `all-ips.txt` using `local-exec`.

## 🧱 Remote Backend

- Uses a remote backend for state file storage (e.g., S3 + DynamoDB or other)
- Ensures consistent infrastructure management across environments

## 📌 Requirements

- Terraform ≥ 1.3.0
- AWS CLI configured
- Access to an AWS account
- SSH key pair
- Git
