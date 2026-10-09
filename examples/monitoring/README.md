# Log Analytics and Diagnostic Settings example

Creates a Resource Group, Log Analytics Workspace, Storage Account, and a diagnostic setting targeting the workspace.

## Prerequisites
- Terraform >= 1.6
- Azure CLI (only needed for an eventual deployment)
- Permissions to create Resource Groups, Log Analytics Workspaces, Storage Accounts, and diagnostic settings

## Validate without deployment
From this directory:
```powershell
terraform init -backend=false
terraform validate
```

## Configure and deploy (optional)
1. Copy `terraform.tfvars.example` to `terraform.tfvars`.
2. Set your subscription ID and a globally unique Storage Account name.
3. Discover supported diagnostic categories for the chosen Storage Account service before enabling logs or metrics. This example defaults to empty category sets so it can be validated without assuming category names.
4. Run `terraform plan` and review expected ingestion and retention costs before `terraform apply`.

## Notes
The example demonstrates the diagnostic-setting pattern. For service-specific Storage logs, Azure may require targeting the Blob, Queue, File, or Table service resource ID rather than only the parent Storage Account.
