output "resource_group_name" {
  description = "Created Resource Group name."
  value       = azurerm_resource_group.this.name
}

output "storage_account_name" {
  description = "Created Storage Account name."
  value       = module.storage_account.name
}

output "storage_account_id" {
  description = "Created Storage Account resource ID."
  value       = module.storage_account.id
}

output "primary_blob_endpoint" {
  description = "Primary Blob endpoint."
  value       = module.storage_account.primary_blob_endpoint
}
