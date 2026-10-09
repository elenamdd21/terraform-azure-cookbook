variable "subscription_id" {
  description = "Azure subscription ID. Do not treat this as a secret, but do not commit customer-specific IDs."
  type        = string
}

variable "name" {
  description = "Name of the resource group."
  type        = string
  default     = "rg-tf-cookbook-dev"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "uksouth"
}

variable "tags" {
  description = "Common resource tags."
  type        = map(string)
  default = {
    environment = "dev"
    managed_by  = "terraform"
    project     = "azure-cookbook"
  }
}
