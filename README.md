# Terraform Azure Cookbook

A portfolio repository of reusable Terraform modules and deployable examples for Microsoft Azure.

> This repository is built incrementally. It does **not** claim to contain every Azure resource type; Azure has hundreds of resource types and new ones are added regularly.

## Goals
- Reusable, small Terraform modules for common Azure building blocks.
- Runnable examples showing how modules fit together.
- Secure defaults where practical (TLS, HTTPS, least privilege, no committed secrets).
- Automated formatting and validation in GitHub Actions.
- Clear prerequisites, deployment instructions, and cleanup steps.

## Repository layout

```text
.
├── modules/                 # Reusable modules (one directory per capability)
├── examples/                # End-to-end, deployable examples
├── docs/                    # Design notes and contribution guidance
├── .github/workflows/       # CI checks
├── .gitignore
└── README.md
```

## Planned resource coverage

### Foundations and governance
- Resource groups, tags, locks
- Management groups, subscriptions, policy assignments (where permissions allow)
- Role assignments and managed identities

### Networking
- Virtual networks, subnets, NSGs, route tables
- Public IPs, NAT Gateway, load balancers, Application Gateway
- Private DNS zones, private endpoints, VPN Gateway, Bastion

### Compute and containers
- Linux/Windows virtual machines, VM scale sets
- Azure Container Registry, Container Apps, AKS
- App Service plans, Web Apps, Functions

### Storage and data
- Storage accounts, containers, file shares
- Key Vault
- Azure SQL, PostgreSQL Flexible Server, Cosmos DB
- Event Hubs, Service Bus

### Monitoring and operations
- Log Analytics, Application Insights, diagnostic settings
- Alerts, action groups, backup vaults

### Integration and analytics
- Data Factory, Databricks workspace, Synapse resources where appropriate

## Requirements
- Terraform >= 1.6
- Azure CLI
- An Azure subscription with permission to create the resources in the chosen example
- AzureRM provider version constrained in each root configuration

## Authentication
For local development, use Azure CLI authentication:

```bash
az login
az account set --subscription "<SUBSCRIPTION_ID>"
```

Do not commit credentials, subscription-specific secrets, state files, `.tfvars` files containing secrets, or real customer configuration.

## Working on an example

1. Change to an example directory.
2. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in non-secret values.
3. Run:

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

4. When finished, clean up resources created by the example:

```bash
terraform destroy
```

Always inspect the plan and expected costs before applying. Some resources can incur charges even when idle.

## Status
Initial scaffold. Modules should be added one by one with input validation, outputs, examples, and documented cost/security considerations.
