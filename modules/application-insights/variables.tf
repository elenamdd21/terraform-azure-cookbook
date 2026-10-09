variable "name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "log_analytics_workspace_id" {
  type = string
}
variable "sampling_percentage" {
  type    = number
  default = 100
  validation {
    condition     = var.sampling_percentage > 0 && var.sampling_percentage <= 100
    error_message = "sampling_percentage must be greater than 0 and at most 100."
  }
}
variable "tags" {
  type    = map(string)
  default = {}
}
