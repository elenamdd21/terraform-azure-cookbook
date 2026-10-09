output "id" {
  description = "Resource ID of the Function App."
  value       = azurerm_linux_function_app.this.id
}

output "name" {
  description = "Name of the Function App."
  value       = azurerm_linux_function_app.this.name
}

output "default_hostname" {
  description = "Default hostname of the Function App."
  value       = azurerm_linux_function_app.this.default_hostname
}

output "principal_id" {
  description = "System-assigned managed identity principal ID."
  value       = azurerm_linux_function_app.this.identity[0].principal_id
}

output "service_plan_id" {
  description = "Resource ID of the App Service Plan."
  value       = azurerm_service_plan.this.id
}
