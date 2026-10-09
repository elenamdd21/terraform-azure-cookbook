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

module "workspace" {
  source              = "../../modules/log-analytics"
  name                = var.workspace_name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = var.tags
}

module "application_insights" {
  source                     = "../../modules/application-insights"
  name                       = var.insights_name
  location                   = var.location
  resource_group_name        = azurerm_resource_group.this.name
  log_analytics_workspace_id = module.workspace.id
  tags                       = var.tags
}

module "web_app" {
  source              = "../../modules/app-service"
  plan_name           = var.plan_name
  app_name            = var.app_name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = var.sku_name
  python_version      = var.python_version
  app_settings = {
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = module.application_insights.connection_string
    "APPINSIGHTS_PROFILERFEATURE_VERSION"   = "1.0.0"
  }
  tags = var.tags
}
