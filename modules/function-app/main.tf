resource "azurerm_service_plan" "this" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_linux_function_app" "this" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = azurerm_service_plan.this.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  https_only                    = true
  functions_extension_version   = "~4"
  builtin_logging_enabled       = true
  public_network_access_enabled = var.public_network_access_enabled

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      python_version = var.python_version
    }
    minimum_tls_version = "1.2"
    ftps_state          = "Disabled"
  }

  app_settings = merge({
    FUNCTIONS_WORKER_RUNTIME              = "python"
    WEBSITE_RUN_FROM_PACKAGE              = "1"
    AzureWebJobsStorage                   = var.azure_web_jobs_storage_connection_string
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.application_insights_connection_string
  }, var.app_settings)

  tags = var.tags
}
