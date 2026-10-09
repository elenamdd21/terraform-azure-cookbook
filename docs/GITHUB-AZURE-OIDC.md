# GitHub Actions → Azure using OIDC (no client secret)

This is a manually triggered **connection check only**. It does not run Terraform and does not create or change Azure resources.

## 1. Create an Entra app/service principal

In Microsoft Entra ID, create an app registration dedicated to this GitHub repository. Record its **Application (client) ID** and **Directory (tenant) ID**. Create or identify its service principal in the target Azure tenant.

## 2. Add a federated credential

In the app registration, open **Certificates & secrets → Federated credentials → Add credential → GitHub Actions deploying Azure resources** (labels may vary). Use:

- Organization/user: `elenamdd21`
- Repository: `terraform-azure-cookbook`
- Entity type: **Environment**
- Environment name: `azure-oidc-check`
- Audience: `api://AzureADTokenExchange`

The resulting subject must be exactly `repo:elenamdd21/terraform-azure-cookbook:environment:azure-oidc-check`. If you choose a branch-based credential instead, change the GitHub workflow to remove the `environment` setting and configure the subject to match the branch. The subject must match exactly.

## 3. Add least-privilege access

Assign the service principal only the Azure RBAC role required for the intended task, scoped as narrowly as possible. For this connection check, `az account show` only reads account context; no resource role is needed for resource creation because no creation occurs. Avoid granting Owner or Contributor broadly just to make a demo pass.

## 4. Add GitHub repository secrets

Under **Settings → Secrets and variables → Actions**, add:

- `AZURE_CLIENT_ID` — application (client) ID
- `AZURE_TENANT_ID` — directory (tenant) ID
- `AZURE_SUBSCRIPTION_ID` — target subscription ID

These IDs are not client secrets, but store them as repository/environment secrets for convenient configuration. **Do not create or store a client secret.**

## 5. Run the check

Commit `.github/workflows/azure-oidc-check.yml`, then open **Actions → Azure OIDC connection check → Run workflow**. Configure the GitHub environment `azure-oidc-check` if required. A successful run confirms federated sign-in and prints the Azure account context.

## Safety notes

- The workflow is manual (`workflow_dispatch`) and does not run `terraform apply`.
- OIDC removes the need for a long-lived client secret; it does not replace least-privilege RBAC or environment protection.
- Before adding a deployment workflow, use a separate protected environment, required reviewers, restricted branch access, and a reviewed Terraform plan. Never put credentials in Terraform files or commit `.tfstate` files.
