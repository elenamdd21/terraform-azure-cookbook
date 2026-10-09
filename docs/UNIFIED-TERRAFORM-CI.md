# Unified Terraform CI

This workflow combines Terraform formatting, example validation, and Checkov scanning in one workflow run.

## Install

1. Copy `.github/workflows/terraform-ci.yml` into the repository's `.github/workflows/` folder.
2. Review the existing workflows before disabling duplicates. Keep `azure-oidc-check.yml` if you still want to run the manual Azure identity test; it is a separate purpose.
3. After confirming this workflow passes, disable or delete only the duplicate workflows that run the same format/validation/security checks (for example `terraform-checks.yml` and `terraform-quality.yml`, if those are your current filenames).
4. Commit and push the changes.

## What it does

- Checks formatting with `terraform fmt -check -recursive`.
- Finds each `examples/*/main.tf`, initializes it without a backend, and runs `terraform validate`.
- Runs Checkov in soft-fail mode initially, so findings are visible without blocking the build.

## Important

- This does not run `terraform plan` or `terraform apply` and does not create Azure resources.
- The validation loop assumes examples are exactly one directory below `examples/` (for example `examples/storage-account/main.tf`).
- Once findings have been reviewed and addressed, consider switching `soft_fail` to `false`.
- Pin third-party actions to full commit SHAs for stricter supply-chain security in a hardened production pipeline.
