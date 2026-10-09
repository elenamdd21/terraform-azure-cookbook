output "resource_group_name" {
  description = "Created Resource Group name."
  value       = azurerm_resource_group.this.name
}

output "log_analytics_workspace_id" {
  description = "Log Analytics Workspace resource ID."
  value       = module.log_analytics.id
}

output "log_analytics_customer_id" {
  description = "Workspace customer ID."
  value       = module.log_analytics.workspace_id
}

output "storage_account_id" {
  description = "Diagnostic target Storage Account ID."
  value       = azurerm_storage_account.diagnostic_target.id
}
