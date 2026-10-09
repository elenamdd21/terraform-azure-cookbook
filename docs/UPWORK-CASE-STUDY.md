# Portfolio Case Study: Terraform Azure Cookbook

## Overview

**Project:** Terraform Azure Cookbook  
**Repository:** https://github.com/elenamdd21/terraform-azure-cookbook  
**Focus:** Azure infrastructure as code, reusable modules, CI validation, and security scanning

## The problem

Azure infrastructure is easier to maintain when common resources are defined consistently, documented clearly, and checked automatically before changes are merged. Repeating resource definitions in every project can lead to drift and missed security settings.

## What I built

I developed a public Terraform repository containing reusable modules and example configurations for common Azure infrastructure components, including:

- Resource Groups and Storage Accounts
- Virtual Networks, subnets, and Network Security Groups
- Key Vault with RBAC and managed identity patterns
- Log Analytics and diagnostic settings
- Python Function App and App Service-related examples
- Application monitoring and private endpoint patterns

I added GitHub Actions workflows for Terraform formatting and validation, plus Checkov scanning to identify common infrastructure-as-code security concerns.

## Engineering decisions

- **Reusable modules:** Inputs and outputs make resources easier to compose and adapt.
- **Examples:** Demonstrate how modules can be connected into a larger configuration.
- **Automated checks:** Catch formatting and configuration errors before deployment.
- **Security scanning:** Surface findings for review rather than treating a passing workflow as proof of security.
- **Cost-conscious workflow:** Use formatting, initialisation without a backend, validation, and static analysis without requiring a live Azure deployment.

## Validation and current limitations

The repository's CI workflows have run successfully for the committed configuration at the time of writing. Terraform validation and static scanning do not replace a real plan/apply test. The modules have not all been verified by deploying them into a live Azure subscription, so the project should be described as a portfolio implementation rather than a production-certified platform.

Before production use, I would test provider/API compatibility in a controlled subscription, review Checkov findings, restrict permissions, use remote state with appropriate access controls, pin third-party Actions to commit SHAs, and add tests and release/versioning practices.

## Skills demonstrated

Terraform · AzureRM · Azure networking · Storage · Key Vault · Managed Identity · RBAC · Log Analytics · Diagnostic Settings · GitHub Actions · CI/CD · Infrastructure security scanning · Technical documentation

## Short Upwork portfolio summary

Built a public Terraform Azure cookbook with reusable infrastructure modules, example configurations, automated formatting and validation through GitHub Actions, and Checkov security scanning. The repository demonstrates modular IaC design and security-aware defaults. CI validation and static scanning are in place; live Azure deployment testing is a clearly identified next step.
