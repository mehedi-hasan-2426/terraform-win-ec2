# Terraform Windows EC2

This project is an AWS exercise I did to practice deploying a Windows EC2 instance with Terraform.

The configuration creates:

- a Windows EC2 instance
- a security group for RDP and HTTP
- web server setup through PowerShell user data
- outputs for the instance ID and public IP

## What this exercise covers

The goal was to launch a Windows server in an existing sandbox VPC and subnet, then access it with an existing EC2 key pair.

## Project files

- `versions.tf` Terraform and provider requirements
- `providers.tf` AWS provider configuration
- `variables.tf` configurable values
- `data.tf` existing VPC and subnet lookups
- `windows-sg.tf` security group rules
- `windows-ec2.tf` EC2 instance definition
- `outputs.tf` instance outputs

## Requirements

- Terraform 1.5+
- an AWS account or temporary lab account
- an existing EC2 key pair in AWS
- a sandbox VPC tagged `sandbox-vpc`
- a subnet tagged `sandbox-public-a`

## How to run

```powershell
cd terraform-win-ec2
terraform init
terraform apply -var "key_pair_name=<YOUR_EXISTING_KEY_PAIR>"
```

## Notes

- This publishable version does not generate or output a private key.
- Terraform state, local key files, and other generated artifacts are excluded from Git.
