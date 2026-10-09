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

module "storage_account" {
  source = "../../modules/storage-account"

  name                          = var.storage_account_name
  resource_group_name           = azurerm_resource_group.this.name
  location                      = azurerm_resource_group.this.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  account_kind                  = "StorageV2"
  access_tier                   = var.access_tier
  public_network_access_enabled = var.public_network_access_enabled
  shared_access_key_enabled     = var.shared_access_key_enabled
  tags                          = var.tags
}
