output "id" {
  value = azurerm_private_endpoint.this.id
}
output "network_interface_ids" {
  value = [for nic in azurerm_private_endpoint.this.network_interface : nic.id]
}
