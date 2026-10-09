variable "function_app_name" {
  description = "Globally unique name for the Linux Function App."
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the Linux App Service Plan."
  type        = string
}

variable "location" {
  description = "Azure region for the resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of an existing resource group."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the existing storage account used by the Function App."
  type        = string
}

variable "storage_account_access_key" {
  description = "Access key for the storage account used by the Function App. Supply via a secure secret mechanism."
  type        = string
  sensitive   = true
}

variable "azure_web_jobs_storage_connection_string" {
  description = "Connection string used by the Functions runtime. Supply via a secure secret mechanism."
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "App Service Plan SKU, for example Y1 or EP1. Choose a SKU that supports the intended workload."
  type        = string
  default     = "Y1"
}

variable "python_version" {
  description = "Python runtime version supported by Azure Functions in the selected region and plan."
  type        = string
  default     = "3.11"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled."
  type        = bool
  default     = true
}

variable "application_insights_connection_string" {
  description = "Optional Application Insights connection string."
  type        = string
  default     = ""
  sensitive   = true
}

variable "app_settings" {
  description = "Additional application settings. Do not put secrets directly in version control."
  type        = map(string)
  default     = {}
  sensitive   = true
}

variable "tags" {
  description = "Tags applied to the Function App and plan."
  type        = map(string)
  default     = {}
}
