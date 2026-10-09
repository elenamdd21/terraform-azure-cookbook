variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group created by this example."
  type        = string
  default     = "rg-tf-keyvault-demo"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "uksouth"
}

variable "key_vault_name" {
  description = "Globally unique Key Vault name (3-24 letters, numbers, or hyphens)."
  type        = string
  default     = "kv-tf-cookbook-demo-123"
}

variable "managed_identity_name" {
  description = "User-assigned managed identity name."
  type        = string
  default     = "id-tf-cookbook-demo"
}

variable "sku_name" {
  description = "Key Vault SKU."
  type        = string
  default     = "standard"
}

variable "soft_delete_retention_days" {
  description = "Deleted objects retention period."
  type        = number
  default     = 90
}

variable "purge_protection_enabled" {
  description = "Enable irreversible purge protection."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Public endpoint access; disable only with private connectivity configured."
  type        = bool
  default     = true
}

variable "network_default_action" {
  description = "Network ACL default action."
  type        = string
  default     = "Deny"
}

variable "allowed_ip_ranges" {
  description = "Approved IPv4 addresses/ranges for access."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default = {
    environment = "demo"
    managed_by  = "terraform"
    project     = "azure-cookbook"
  }
}
