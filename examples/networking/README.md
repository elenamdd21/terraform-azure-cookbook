# Networking example

Creates a Resource Group, Virtual Network, subnet, Network Security Group, and associates the NSG with the subnet.

## Prerequisites
- Terraform >= 1.6
- Azure CLI installed and authenticated (`az login`)
- Permission to create Resource Groups and network resources in the selected subscription

## Validate without Azure deployment
From this directory:
```powershell
terraform init -backend=false
terraform validate
```

## Plan and deploy (optional)
1. Copy `terraform.tfvars.example` to `terraform.tfvars`.
2. Set `subscription_id`.
3. Review the example NSG rule. It permits inbound TCP/443 only from `10.0.0.0/8`; adjust this range to your approved source network.
4. Run `terraform plan` and inspect every change before applying.

## Cleanup
If the example was deployed exclusively for testing:
```powershell
terraform destroy
```

Do not destroy shared or production resources. Review Azure costs and security requirements before deployment.
