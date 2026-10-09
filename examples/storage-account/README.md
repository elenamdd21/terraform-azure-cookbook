# Storage Account example

Creates a dedicated Resource Group and a Storage Account using the reusable module.

## Prerequisites
- Terraform >= 1.6
- Azure CLI installed and authenticated (`az login`)
- Permission to create Resource Groups and Storage Accounts in the selected subscription
- A globally unique Storage Account name

## Configure
1. Copy `terraform.tfvars.example` to `terraform.tfvars`.
2. Set `subscription_id` and choose a globally unique `storage_account_name` (3–24 lowercase letters/numbers).
3. Authenticate and select the intended subscription:
   ```powershell
   az login
   az account set --subscription "<SUBSCRIPTION_ID>"
   ```

## Validate before deploying
From this directory:
```powershell
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

Review the plan and expected costs before running `terraform apply`.

## Cleanup
If this example created the Resource Group and its resources exclusively for testing, clean up with:
```powershell
terraform destroy
```

Do not use `terraform destroy` against shared or production resources. Storage usage, replication, transactions, data retrieval, and network features can incur charges.
