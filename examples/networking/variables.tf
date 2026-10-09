variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name created by this example."
  type        = string
  default     = "rg-tf-network-demo"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "uksouth"
}

variable "virtual_network_name" {
  description = "Virtual Network name."
  type        = string
  default     = "vnet-tf-demo"
}

variable "address_space" {
  description = "Virtual Network address space."
  type        = list(string)
  default     = ["10.30.0.0/16"]
}

variable "subnet_name" {
  description = "Subnet name."
  type        = string
  default     = "snet-app"
}

variable "subnet_address_prefixes" {
  description = "Subnet address prefixes within the VNet address space."
  type        = list(string)
  default     = ["10.30.1.0/24"]
}

variable "network_security_group_name" {
  description = "NSG name."
  type        = string
  default     = "nsg-app"
}

variable "security_rules" {
  description = "Example inbound HTTPS rule limited to an RFC1918 source range; adjust for your approved network."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = optional(string)
    destination_port_range     = optional(string)
    source_address_prefix      = optional(string)
    destination_address_prefix = optional(string)
    description                = optional(string)
  }))
  default = [{
    name                       = "AllowHttpsInboundFromPrivateNetwork"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
    description                = "Example only. Adjust source range to match approved connectivity."
  }]
}

variable "tags" {
  description = "Tags applied to the Resource Group, VNet, and NSG."
  type        = map(string)
  default = {
    environment = "demo"
    managed_by  = "terraform"
    project     = "azure-cookbook"
  }
}
