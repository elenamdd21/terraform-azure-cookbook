variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for this example."
  type        = string
  default     = "rg-tf-storage-demo"
}

variable "storage_account_name" {
  description = "Globally unique, 3-24 lowercase alphanumeric characters."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Use 3-24 lowercase letters and numbers only."
  }
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "uksouth"
}

variable "account_tier" {
  description = "Storage performance tier."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage replication type."
  type        = string
  default     = "LRS"
}

variable "access_tier" {
  description = "Blob access tier."
  type        = string
  default     = "Hot"
}

variable "public_network_access_enabled" {
  description = "Public network access. Set false only when private connectivity is ready."
  type        = bool
  default     = true
}

variable "shared_access_key_enabled" {
  description = "Account-key access. Disable when Entra ID auth is configured for clients."
  type        = bool
  default     = true
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
