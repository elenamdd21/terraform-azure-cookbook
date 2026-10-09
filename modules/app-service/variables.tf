variable "plan_name" {
  type = string
}
variable "app_name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "sku_name" {
  type    = string
  default = "B1"
}
variable "python_version" {
  type    = string
  default = "3.12"
}
variable "always_on" {
  type    = bool
  default = true
}
variable "app_settings" {
  type    = map(string)
  default = {}
}
variable "tags" {
  type    = map(string)
  default = {}
}
