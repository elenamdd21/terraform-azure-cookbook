# Storage Account module

Creates an Azure Storage Account in an existing Resource Group.

## Security choices
- Enforces HTTPS-only traffic and TLS 1.2 minimum.
- Prevents anonymous public access to nested storage items.
- Makes public network access configurable; set it to `false` when private connectivity has been configured.
- Makes shared-key access configurable. Disabling it requires workloads to authenticate using a supported Microsoft Entra ID method.

## Important compatibility notes
- Storage Account names must be globally unique, 3–24 characters, lowercase letters and numbers only.
- `access_tier` applies only to account kinds that support it. Check the chosen account kind before deployment.
- Some tier/replication/account-kind combinations are not supported in every region.
- Disabling public network access without a Private Endpoint or another valid private path can make the account inaccessible.

## Inputs
See `variables.tf` for descriptions, types, defaults, and validation.

## Outputs
- `id`
- `name`
- `primary_location`
- `primary_blob_endpoint`

## Cost and cleanup
Storage, transactions, replication, data retrieval, and networking features may incur charges. Review the Azure pricing and Terraform plan before applying. Destroy only resources created for this test; do not use this example against production resources.
