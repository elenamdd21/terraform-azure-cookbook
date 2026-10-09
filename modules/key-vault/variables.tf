variable "key_vault_name" {
  description = "Globally unique Key Vault name, 3-24 characters."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{3,24}$", var.key_vault_name)) && !startswith(var.key_vault_name, "-") && !endswith(var.key_vault_name, "-")
    error_message = "Key Vault names must be 3-24 characters, use letters, numbers, and hyphens, and not start or end with a hyphen."
  }
}

variable "managed_identity_name" {
  description = "Name for the user-assigned managed identity."
  type        = string
}

variable "resource_group_name" {
  description = "Name of an existing Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID."
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "sku_name must be standard or premium."
  }
}

variable "soft_delete_retention_days" {
  description = "Number of days deleted vault objects are retained."
  type        = number
  default     = 90

  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "soft_delete_retention_days must be between 7 and 90."
  }
}

variable "purge_protection_enabled" {
  description = "Enable purge protection. Once enabled, it cannot be disabled."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Enable public endpoint access. Disable only after configuring private connectivity."
  type        = bool
  default     = true
}

variable "network_default_action" {
  description = "Default network ACL action. Deny requires an allowed IP range or supported private connectivity."
  type        = string
  default     = "Deny"

  validation {
    condition     = contains(["Allow", "Deny"], var.network_default_action)
    error_message = "network_default_action must be Allow or Deny."
  }
}

variable "allowed_ip_ranges" {
  description = "IPv4 CIDR/IP ranges permitted by Key Vault network ACLs."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default     = {}
}
