terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "networking" {
  source = "../../modules/networking"

  resource_group_name         = azurerm_resource_group.this.name
  location                    = azurerm_resource_group.this.location
  virtual_network_name        = var.virtual_network_name
  address_space               = var.address_space
  subnet_name                 = var.subnet_name
  subnet_address_prefixes     = var.subnet_address_prefixes
  network_security_group_name = var.network_security_group_name
  security_rules              = var.security_rules
  tags                        = var.tags
}
