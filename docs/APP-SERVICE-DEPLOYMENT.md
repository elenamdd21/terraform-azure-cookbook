# Deployment pipeline and private networking notes

## GitHub Actions deployment
The file `.github/workflows/terraform-deploy-template.yml` is deliberately a template only. Before enabling real deployment:
1. Configure Microsoft Entra workload identity federation (OIDC) for the GitHub repository/environment.
2. Assign least-privilege Azure RBAC scoped to the target resource group.
3. Configure a remote Terraform backend with locking and protected state access.
4. Separate `plan` and `apply`, publish/review the plan, and require environment approval for production.
5. Pin GitHub Actions to reviewed commit SHAs and review provider/action updates.
6. Never store client secrets or Terraform state in the repository.

## Private networking
Use `modules/private-endpoint` for private access to supported Azure PaaS resources. Provide the correct `subresource_names` for the target. Configure the relevant private DNS zone and VNet links separately, test name resolution from the intended network, and disable public access on the target only after private connectivity has been verified. A private endpoint is not a substitute for DNS configuration, access control, or end-to-end network testing.

## Cost and safety
Do not run `terraform apply` just to validate code. App Service Plans, Application Insights ingestion, Log Analytics ingestion/retention, and private endpoints may incur charges.
