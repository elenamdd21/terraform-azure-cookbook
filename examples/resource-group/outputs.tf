output "resource_group_name" {
  description = "Created resource group name."
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "Created resource group ID."
  value       = azurerm_resource_group.this.id
}
