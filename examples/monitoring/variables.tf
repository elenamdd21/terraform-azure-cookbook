variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group created by this example."
  type        = string
  default     = "rg-tf-monitoring-demo"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "uksouth"
}

variable "workspace_name" {
  description = "Log Analytics Workspace name."
  type        = string
  default     = "law-tf-monitoring-demo"
}

variable "retention_in_days" {
  description = "Workspace retention in days."
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "Daily ingestion cap in GB; -1 means no cap."
  type        = number
  default     = -1
}

variable "storage_account_name" {
  description = "Globally unique 3-24 lowercase alphanumeric Storage Account name."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Storage Account names must be 3-24 lowercase letters and numbers."
  }
}

variable "storage_log_categories" {
  description = "Supported diagnostic log categories for the chosen Storage Account service."
  type        = set(string)
  default     = []
}

variable "storage_metric_categories" {
  description = "Supported diagnostic metric categories for the chosen Storage Account service."
  type        = set(string)
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
