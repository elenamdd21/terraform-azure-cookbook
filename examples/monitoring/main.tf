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

module "log_analytics" {
  source = "../../modules/log-analytics"

  workspace_name      = var.workspace_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  retention_in_days   = var.retention_in_days
  daily_quota_gb      = var.daily_quota_gb
  tags                = var.tags
}

# Example target resource: the Storage Account module's resource ID is used
# here to demonstrate the diagnostic-setting module pattern.
resource "azurerm_storage_account" "diagnostic_target" {
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.this.name
  location                        = azurerm_resource_group.this.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  account_kind                    = "StorageV2"
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  tags                            = var.tags
}

module "storage_diagnostics" {
  source = "../../modules/diagnostic-setting"

  name                       = "storage-to-log-analytics"
  target_resource_id         = azurerm_storage_account.diagnostic_target.id
  log_analytics_workspace_id = module.log_analytics.id
  log_categories             = var.storage_log_categories
  metric_categories          = var.storage_metric_categories
}
