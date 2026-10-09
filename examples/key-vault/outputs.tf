output "resource_group_name" {
  description = "Created Resource Group name."
  value       = azurerm_resource_group.this.name
}

output "key_vault_id" {
  description = "Key Vault ID."
  value       = module.key_vault.key_vault_id
}

output "key_vault_uri" {
  description = "Key Vault URI."
  value       = module.key_vault.key_vault_uri
}

output "managed_identity_client_id" {
  description = "Managed identity client ID."
  value       = module.key_vault.managed_identity_client_id
}

output "managed_identity_principal_id" {
  description = "Managed identity principal ID."
  value       = module.key_vault.managed_identity_principal_id
}
