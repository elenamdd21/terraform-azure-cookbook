variable "name" {
  description = "Globally unique Storage Account name: 3-24 lowercase letters and numbers."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.name))
    error_message = "Storage Account names must be 3-24 characters and contain only lowercase letters and numbers."
  }
}

variable "resource_group_name" {
  description = "Name of the existing resource group."
  type        = string
}

variable "location" {
  description = "Azure region, for example uksouth."
  type        = string
}

variable "account_tier" {
  description = "Performance tier."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "account_tier must be Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "Replication option for the storage account."
  type        = string
  default     = "LRS"

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "Use a supported replication type: LRS, GRS, RAGRS, ZRS, GZRS, or RAGZRS."
  }
}

variable "account_kind" {
  description = "Storage account kind."
  type        = string
  default     = "StorageV2"

  validation {
    condition     = contains(["StorageV2", "BlobStorage", "BlockBlobStorage", "FileStorage"], var.account_kind)
    error_message = "Use StorageV2, BlobStorage, BlockBlobStorage, or FileStorage."
  }
}

variable "access_tier" {
  description = "Access tier for supported account kinds."
  type        = string
  default     = "Hot"

  validation {
    condition     = contains(["Hot", "Cool"], var.access_tier)
    error_message = "access_tier must be Hot or Cool."
  }
}

variable "public_network_access_enabled" {
  description = "Whether the public network endpoint is enabled. Set false when private connectivity is configured."
  type        = bool
  default     = true
}

variable "shared_access_key_enabled" {
  description = "Whether account-key authorization is enabled. Disable only when clients use supported Entra ID authentication."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to the storage account."
  type        = map(string)
  default     = {}
}
