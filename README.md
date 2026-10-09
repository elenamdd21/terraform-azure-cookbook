# Terraform Azure Cookbook

Reusable Terraform modules and practical examples for common Azure building blocks. The project emphasizes repeatability, documentation, security-minded defaults, and automated validation without requiring an active Azure subscription for CI checks.

## Modules

| Area | Module | Purpose |
|---|---|---|
| Foundation | Resource Group | Organize Azure resources and tags |
| Storage | Storage Account | Configure secure Azure Storage defaults |
| Networking | Virtual Network, Subnet, NSG | Reusable network foundation and security rules |
| Identity & secrets | Key Vault + Managed Identity | RBAC-based vault access and workload identity |
| Monitoring | Log Analytics + Diagnostic Settings | Centralize logs and diagnostics |
| Compute | Python Function App | Serverless application hosting example |
| Web hosting | App Service | Web app hosting example |
| Observability | Application Insights | Application telemetry example |
| Networking | Private Endpoint | Private connectivity building block |

> Module availability depends on the directories currently present in this repository. Check `modules/` and `examples/` for the source of truth.

## Quality checks

GitHub Actions can check Terraform formatting, initialize and validate examples without configuring an Azure backend, and run Checkov security scanning. These checks do not create Azure resources.

## Quick start

Prerequisites: Terraform CLI and Git.

```powershell
terraform fmt -recursive
terraform -chdir=examples/resource-group init -backend=false
terraform -chdir=examples/resource-group validate
```

Replace `examples/resource-group` with another example directory to validate a different module composition.

## Security

- Review example values before using them in a real environment.
- Configure approved network access and identity permissions for your own environment.
- Never commit credentials, Terraform state files, or secret values.
- Do not run `terraform apply` unless you intentionally want to create billable Azure resources.

See [`docs/SECURITY-SCANNING.md`](docs/SECURITY-SCANNING.md) for Checkov workflow guidance and [`docs/ROADMAP.md`](docs/ROADMAP.md) for planned improvements.

## Disclaimer

This is a learning and portfolio project. Validate module behavior, provider versions, Azure service requirements, and security settings before production use.
