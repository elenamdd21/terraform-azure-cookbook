variable "resource_group_name" {
  description = "Name of an existing Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region, for example uksouth."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the Virtual Network."
  type        = string
}

variable "address_space" {
  description = "IPv4 address spaces for the Virtual Network."
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "dns_servers" {
  description = "Optional custom DNS server IP addresses. Empty uses Azure-provided DNS."
  type        = list(string)
  default     = []
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
  default     = "snet-app"
}

variable "subnet_address_prefixes" {
  description = "IPv4 address prefixes assigned to the subnet."
  type        = list(string)
  default     = ["10.20.1.0/24"]
}

variable "network_security_group_name" {
  description = "Name of the Network Security Group."
  type        = string
}

variable "security_rules" {
  description = "List of NSG rules. Define only rules required by the workload."
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
  default = []

  validation {
    condition = alltrue([
      for rule in var.security_rules :
      rule.priority >= 100 && rule.priority <= 4096 &&
      contains(["Inbound", "Outbound"], rule.direction) &&
      contains(["Allow", "Deny"], rule.access) &&
      contains(["Tcp", "Udp", "Icmp", "*"], rule.protocol)
    ])
    error_message = "Each rule must use priority 100-4096, direction Inbound/Outbound, access Allow/Deny, and protocol Tcp/Udp/Icmp/*."
  }
}

variable "tags" {
  description = "Tags applied to the VNet and NSG."
  type        = map(string)
  default     = {}
}
