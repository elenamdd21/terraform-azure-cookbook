# Terraform security scanning with Checkov

This repository runs Checkov in GitHub Actions to flag common Terraform security and configuration risks.

## What the scan does

- Scans Terraform files for known misconfigurations and policy violations.
- Runs automatically on pushes and pull requests, and can also be started manually.
- Uses `soft_fail: true` initially so findings are visible without unexpectedly blocking the existing portfolio workflow.

## How to use findings

1. Open the **Terraform Quality and Security** workflow in GitHub Actions.
2. Open the **Checkov security scan** job and review each finding, including the check ID and affected file.
3. Fix confirmed issues where appropriate, then rerun the workflow.
4. Do not blindly suppress a finding. If a check is not applicable, document why and use a narrowly scoped suppression with a reason.

## Important notes

- A clean scan is not proof that infrastructure is completely secure.
- Some checks may flag example configurations intentionally designed for learning. Review the context before changing them.
- This workflow does not deploy resources or run `terraform apply`.
- `soft_fail: true` means the scan reports findings but does not fail the job solely because findings exist. Once the repository is consistently clean, consider changing this to `false`.
