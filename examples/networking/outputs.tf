output "resource_group_name" {
  description = "Created Resource Group name."
  value       = azurerm_resource_group.this.name
}

output "virtual_network_id" {
  description = "Virtual Network ID."
  value       = module.networking.virtual_network_id
}

output "subnet_id" {
  description = "Subnet ID."
  value       = module.networking.subnet_id
}

output "network_security_group_id" {
  description = "Network Security Group ID."
  value       = module.networking.network_security_group_id
}
