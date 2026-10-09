# Terraform Azure Cookbook

Reusable Terraform modules for common Azure infrastructure patterns, with examples, documentation, and automated quality checks.

> **Project status:** Portfolio / learning project. The examples are validated in CI; they have not necessarily been deployed to a live Azure subscription. Review and adapt every configuration to your organisation's security and compliance requirements before production use.

## What this project demonstrates

- Reusable Terraform module design with variables and outputs
- Azure infrastructure patterns and security-conscious defaults
- Example configurations that compose modules together
- Automated formatting and Terraform validation with GitHub Actions
- Static infrastructure security scanning with Checkov
- Documentation for setup, usage, and deployment considerations

## Modules

| Module | Purpose |
|---|---|
| `resource-group` | Creates an Azure Resource Group |
| `storage-account` | Creates an Azure Storage Account with configurable security and replication settings |
| `networking` | Creates a Virtual Network, subnet, Network Security Group, and association |
| `key-vault` | Creates an Azure Key Vault configured for RBAC, soft delete, and purge protection |
| `log-analytics` | Creates a Log Analytics workspace |
| `diagnostic-setting` | Sends supported resource diagnostic logs and metrics to a Log Analytics workspace |
| `function-app` | Example module for a Python Azure Function App |
| `app-service` | Example module for an Azure App Service / Web App |
| `application-insights` | Example module for application monitoring |
| `private-endpoint` | Example module for private connectivity patterns |

Check the module README files for exact inputs, outputs, provider requirements, and limitations. Not every module has been tested against a live Azure subscription.

## Repository layout

```text
.
├── .github/
│   └── workflows/       # Terraform CI and optional Azure OIDC workflow
├── modules/             # Reusable Terraform modules
├── examples/            # Example compositions of modules
└── docs/                # Guides and project documentation
```

## Quality checks

The unified Terraform CI workflow is intended to:

1. Check formatting with `terraform fmt -check -recursive`.
2. Initialise each example without a remote backend.
3. Run `terraform validate` for each example.
4. Run Checkov to surface common infrastructure-as-code security findings.

Check the **Actions** tab for the latest workflow status. Checkov findings may initially be reported in soft-fail mode; review and remediate findings rather than assuming a passing workflow means the configuration is production-ready.

## Quick start

Prerequisites:
- Terraform CLI compatible with the version pinned in the workflow
- AzureRM provider version compatible with the module's provider constraints
- Azure access only when you choose to plan or deploy resources

Validate an example locally:

```powershell
terraform fmt -recursive
terraform -chdir=examples/storage-account init -backend=false
terraform -chdir=examples/storage-account validate
```

Replace `examples/storage-account` with the example you want to validate. Example paths depend on which folders currently exist in the repository.

## Safety and cost

- `terraform validate` checks configuration syntax and internal consistency; it does **not** prove that an Azure deployment will succeed.
- `terraform init -backend=false` and `terraform validate` do not create Azure resources.
- Review security findings, allowed network ranges, RBAC scopes, diagnostic categories, and service-specific requirements before deployment.
- Some resources may incur charges if deployed. Review Azure pricing and clean up test resources when finished.
- Purge protection, once enabled on a Key Vault, cannot simply be disabled; consider this carefully in disposable test environments.

## Future improvements

- Add tests for module inputs and outputs, and deployment tests in a dedicated Azure subscription.
- Pin third-party GitHub Actions to full commit SHAs.
- Add pull-request checks, branch protection, and a reviewed security baseline.
- Add examples using remote state and workload identity federation (OIDC), with least-privilege permissions.
- Publish a versioned module release process.

## Author

Created as a hands-on Azure and Terraform portfolio project. See the module documentation and workflow history for implementation details.

## License and Usage

Copyright © 2026 the repository author. All rights reserved.

This repository is published publicly for portfolio review and demonstration purposes.

Unless expressly agreed in writing by the copyright holder, no license is granted to use, copy, modify, redistribute, or commercially exploit the source code.

Viewing and forking this public repository on GitHub does not grant any additional rights beyond those provided by applicable law and GitHub's Terms of Service.

For commercial use, licensing, or permission to reuse any part of this project, please contact the copyright holder.
