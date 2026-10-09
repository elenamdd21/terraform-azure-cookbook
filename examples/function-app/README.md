# Function App example

Demonstrates the reusable `modules/function-app` module with a resource group and Storage Account.

## Validate without deploying

```powershell
terraform init -backend=false
terraform validate
```

Do not run `terraform apply` until you have configured valid unique resource names, authenticated to Azure, and supplied the Storage Account key and Functions runtime connection string securely. The placeholder values intentionally are not deployable credentials.

The example is intended for configuration validation and portfolio demonstration; it has not been deployed to Azure. Confirm current Functions runtime, plan SKU, and regional support before a real deployment.
