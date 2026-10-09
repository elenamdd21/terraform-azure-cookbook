output "resource_group_name" {
  value       = azurerm_resource_group.this.name
  description = "Resource group created by the example."
}

output "function_app_name" {
  value       = module.function_app.name
  description = "Function App name."
}

output "function_app_hostname" {
  value       = module.function_app.default_hostname
  description = "Default Function App hostname."
}

output "managed_identity_principal_id" {
  value       = module.function_app.principal_id
  description = "System-assigned managed identity principal ID."
}
