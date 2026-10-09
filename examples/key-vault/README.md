# Key Vault + Managed Identity example

Creates a Resource Group, Key Vault, user-assigned managed identity, and a vault-scoped `Key Vault Secrets User` role assignment.

## Prerequisites
- Terraform >= 1.6
- Azure CLI installed and authenticated (`az login`)
- Permissions to create Resource Groups, Key Vaults, managed identities, and role assignments
- Unique Key Vault name and correct subscription/tenant IDs

## Validate without deployment
From this directory:
```powershell
terraform init -backend=false
terraform validate
```

## Before deployment
1. Copy `terraform.tfvars.example` to `terraform.tfvars`.
2. Set your subscription and tenant IDs.
3. Choose a globally unique vault name.
4. The network ACL default is `Deny` and the allowed IP list is empty. Add approved IP ranges or configure private connectivity before expecting access.
5. Review the Terraform plan and expected costs before applying.

## Cleanup
Purge protection is enabled by default and cannot be disabled after enabling. Soft-deleted vaults and objects are retained for the configured period. Plan cleanup carefully and do not deploy this example into a production subscription without review.
