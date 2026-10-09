# Key Vault + Managed Identity module

Creates an Azure Key Vault configured for Azure RBAC, a user-assigned managed identity, and a `Key Vault Secrets User` role assignment scoped to that vault.

## Security notes
- RBAC authorization is enabled; access should be granted through least-privilege role assignments.
- Purge protection defaults to enabled. Once enabled, it cannot be disabled and can complicate cleanup.
- Network ACLs default to `Deny` with no allowed IP ranges. Add approved IP ranges or configure private connectivity before expecting clients to reach the vault.
- Public network access is separately configurable. Disable it only after private connectivity is configured and tested.
- The identity is granted read access to secret contents via `Key Vault Secrets User`; it is not granted permission to create or delete secrets.
- This module does not create or store any secret values.

## Inputs and outputs
See `variables.tf` and `outputs.tf`.

## Usage
```hcl
module "key_vault" {
  source = "../../modules/key-vault"

  key_vault_name      = "kv-example-12345"
  managed_identity_name = "id-app-example"
  resource_group_name = "rg-app"
  location            = "uksouth"
  tenant_id           = "00000000-0000-0000-0000-000000000000"

  # Configure approved client IPs or private networking before use.
  allowed_ip_ranges = ["203.0.113.10/32"]

  tags = {
    environment = "demo"
    managed_by  = "terraform"
  }
}
```

Replace all example names, IDs, and IP addresses before deployment. The IP range in this example is documentation-only and is not a real client address.

## Costs and cleanup
Key Vault operations and premium HSM-backed features may incur charges. Review Azure pricing and the plan before deployment. Purge protection can retain deleted vaults/objects for the configured period; plan cleanup carefully.
