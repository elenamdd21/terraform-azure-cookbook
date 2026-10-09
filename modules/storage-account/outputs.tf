output "id" {
  description = "Storage Account resource ID."
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Storage Account name."
  value       = azurerm_storage_account.this.name
}

output "primary_location" {
  description = "Primary Azure location."
  value       = azurerm_storage_account.this.primary_location
}

output "primary_blob_endpoint" {
  description = "Primary Blob service endpoint."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}
