# Resource Group module

Reusable module for an Azure Resource Group.

## Inputs
- `name` (string, required)
- `location` (string, required)
- `tags` (map(string), optional)

## Outputs
- `name`
- `id`

## Example
```hcl
module "resource_group" {
  source   = "../../modules/resource-group"
  name     = "rg-example-dev"
  location = "uksouth"
  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}
```
