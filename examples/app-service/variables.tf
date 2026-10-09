variable "subscription_id" {
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
  description = "Set to your Azure subscription ID before deployment; validation does not require a real subscription."
}
variable "resource_group_name" {
  type    = string
  default = "rg-cookbook-appservice-example"
}
variable "location" {
  type    = string
  default = "uksouth"
}
variable "workspace_name" {
  type    = string
  default = "law-cookbook-example-001"
}
variable "insights_name" {
  type    = string
  default = "appi-cookbook-example-001"
}
variable "plan_name" {
  type    = string
  default = "asp-cookbook-example-001"
}
variable "app_name" {
  type        = string
  default     = "web-cookbook-example-001"
  description = "Must be globally unique if deployed."
}
variable "sku_name" {
  type    = string
  default = "B1"
}
variable "python_version" {
  type    = string
  default = "3.12"
}
variable "tags" {
  type = map(string)
  default = {
    environment = "example"
    managed_by  = "terraform"
  }
}
