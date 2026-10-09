variable "name" {
  description = "Diagnostic setting name."
  type        = string
  default     = "send-to-log-analytics"
}

variable "target_resource_id" {
  description = "Resource ID of the Azure resource to monitor."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Resource ID of the destination Log Analytics Workspace."
  type        = string
}

variable "log_categories" {
  description = "Log categories supported by the target resource. Check Azure-supported categories before applying."
  type        = set(string)
  default     = []
}

variable "metric_categories" {
  description = "Metric categories supported by the target resource. Check Azure-supported categories before applying."
  type        = set(string)
  default     = []
}
