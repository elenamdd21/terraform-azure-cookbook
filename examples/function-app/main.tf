terraform {
  required_version = ">= 1.5.0"
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

resource "azurerm_storage_account" "this" {
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.this.name
  location                        = azurerm_resource_group.this.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  https_traffic_only_enabled      = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  tags                            = var.tags
}

module "function_app" {
  source = "../../modules/function-app"

  function_app_name                        = var.function_app_name
  app_service_plan_name                    = var.app_service_plan_name
  location                                 = azurerm_resource_group.this.location
  resource_group_name                      = azurerm_resource_group.this.name
  storage_account_name                     = azurerm_storage_account.this.name
  storage_account_access_key               = var.storage_account_access_key
  azure_web_jobs_storage_connection_string = var.azure_web_jobs_storage_connection_string
  sku_name                                 = var.sku_name
  python_version                           = var.python_version
  public_network_access_enabled            = var.public_network_access_enabled
  application_insights_connection_string   = var.application_insights_connection_string
  tags                                     = var.tags
}
