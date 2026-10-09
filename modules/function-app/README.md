# Linux Azure Function App module

Creates a Linux App Service Plan and Python Azure Function App with HTTPS-only access, TLS 1.2, FTPS disabled, and a system-assigned managed identity.

## Notes
- The resource group and Storage Account must already exist.
- Supply the Storage Account key and Functions runtime connection string through a secure mechanism (for example, a CI secret or local environment-backed Terraform variables). Never commit real secrets or `terraform.tfvars` containing secrets.
- The sample uses `Y1` as a low-cost consumption-plan example; confirm SKU/runtime compatibility and current regional availability before deployment.
- `terraform validate` checks configuration structure only. It does not confirm Azure API compatibility or deploy/test the app.
- For production, consider Key Vault references or identity-based host storage where supported by your chosen Functions configuration, plus private networking and monitoring requirements.

## Inputs
See `variables.tf` for the complete input list.
