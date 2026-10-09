# Diagnostic Setting module

Routes supported resource logs and/or metrics to an existing Log Analytics Workspace.

## Important
- Log and metric categories vary by Azure resource type. Discover the supported categories for the target resource before deployment.
- At least one supported log or metric category should be configured for useful diagnostics.
- Enabling diagnostics may increase ingestion costs.
- The target resource and workspace must be in compatible regions/subscriptions and the caller needs appropriate permissions.

## Inputs and outputs
See `variables.tf` and `outputs.tf`.
