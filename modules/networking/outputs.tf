output "virtual_network_id" {
  description = "Virtual Network resource ID."
  value       = azurerm_virtual_network.this.id
}

output "virtual_network_name" {
  description = "Virtual Network name."
  value       = azurerm_virtual_network.this.name
}

output "subnet_id" {
  description = "Subnet resource ID."
  value       = azurerm_subnet.this.id
}

output "subnet_name" {
  description = "Subnet name."
  value       = azurerm_subnet.this.name
}

output "network_security_group_id" {
  description = "Network Security Group resource ID."
  value       = azurerm_network_security_group.this.id
}

output "network_security_group_name" {
  description = "Network Security Group name."
  value       = azurerm_network_security_group.this.name
}
