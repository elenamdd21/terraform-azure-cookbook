# Resource group example

Creates a resource group in the selected subscription.

## Run

1. Authenticate with Azure CLI: `az login`
2. Copy `terraform.tfvars.example` to `terraform.tfvars`.
3. Set your subscription ID.
4. Run `terraform init`, `terraform plan`, and `terraform apply`.
5. Clean up with `terraform destroy`.

Review the plan before applying. This example creates a resource group; resources created inside it are not automatically created by this example.
