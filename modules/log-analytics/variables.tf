variable "workspace_name" {
  description = "Name of the Log Analytics workspace."
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

variable "sku" {
  description = "Log Analytics workspace pricing tier."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Workspace data retention in days."
  type        = number
  default     = 30

  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "retention_in_days must be between 30 and 730."
  }
}

variable "daily_quota_gb" {
  description = "Optional daily ingestion cap in GB. Use -1 to disable the cap."
  type        = number
  default     = -1
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default     = {}
}
