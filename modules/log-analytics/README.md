# Log Analytics Workspace module

Creates an Azure Log Analytics Workspace with configurable retention, SKU, and optional daily ingestion cap.

## Cost and operations
- Ingestion and retention can incur charges. Review Azure Monitor pricing before deployment.
- `daily_quota_gb = -1` disables the daily cap; set a positive cap only after estimating expected ingestion.
- The retention input is validated between 30 and 730 days for this module.
- This module creates the workspace only; it does not automatically route diagnostic logs from other resources.

## Inputs and outputs
See `variables.tf` and `outputs.tf`.
