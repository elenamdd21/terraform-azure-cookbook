variable "subscription_id" {
  description = "Azure subscription ID used by the provider."
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "resource_group_name" {
  description = "Resource group name for the example."
  type        = string
  default     = "rg-tf-function-example"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "uksouth"
}

variable "storage_account_name" {
  description = "Globally unique lowercase storage account name (3-24 characters)."
  type        = string
  default     = "sttfexample123456"
}

variable "function_app_name" {
  description = "Globally unique Function App name."
  type        = string
  default     = "func-tf-example-123456"
}

variable "app_service_plan_name" {
  description = "App Service Plan name."
  type        = string
  default     = "asp-tf-function-example"
}

variable "storage_account_access_key" {
  description = "Storage account key; provide securely before deployment."
  type        = string
  default     = "REPLACE_WITH_SECURE_VALUE"
  sensitive   = true
}

variable "azure_web_jobs_storage_connection_string" {
  description = "Functions host storage connection string; provide securely before deployment."
  type        = string
  default     = "REPLACE_WITH_SECURE_VALUE"
  sensitive   = true
}

variable "sku_name" {
  type        = string
  description = "App Service Plan SKU."
  default     = "Y1"
}

variable "python_version" {
  type        = string
  description = "Python runtime version."
  default     = "3.11"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Enable public network access for the Function App."
  default     = true
}

variable "application_insights_connection_string" {
  type        = string
  description = "Optional Application Insights connection string."
  default     = ""
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default = {
    managed_by = "terraform"
    example    = "function-app"
  }
}
