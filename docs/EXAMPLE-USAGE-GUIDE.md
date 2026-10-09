# Example usage guide

Use this as a lightweight guide for a client or reviewer. Exact variable names vary by module; always check the selected module's `variables.tf` and README before using a snippet.

## Typical workflow

1. Choose a module under `modules/`.
2. Read its README, inputs, outputs, provider constraints, and security notes.
3. Review the corresponding example under `examples/`.
4. Set environment-specific values and approved network ranges.
5. Run `terraform fmt -recursive`.
6. Run `terraform init -backend=false` and `terraform validate` for the example.
7. Review Checkov output and fix or document findings.
8. Before any real deployment, configure a secure state backend, review the plan, confirm access controls and costs, and obtain approval.

## Example validation commands

```powershell
terraform fmt -check -recursive
terraform -chdir=examples/storage-account init -backend=false
terraform -chdir=examples/storage-account validate
```

Use an example directory that exists in the repository.

## Important

These commands validate configuration locally; they do not create Azure resources. A successful validation does not guarantee Azure API acceptance or production security. For deployment, use an approved subscription and follow least-privilege, change review, state protection, and cost controls.
