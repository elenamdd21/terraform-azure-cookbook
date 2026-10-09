# App Service + Application Insights example

Demonstrates a Linux Python Web App with system-assigned managed identity and workspace-based Application Insights.

## Validate without Azure access

```powershell
terraform init -backend=false
terraform validate
```

## Before deploying
- Replace the placeholder subscription ID.
- Choose globally unique names.
- Review costs for the App Service Plan and monitoring ingestion.
- Configure app code/deployment and any required outbound network access.
- Do not commit secrets or state files.

This example is for validation and portfolio demonstration; it has not been deployed as part of this repository workflow.
