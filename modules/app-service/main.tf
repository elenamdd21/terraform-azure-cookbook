resource "azurerm_service_plan" "this" {
  name                = var.plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_linux_web_app" "this" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.this.id
  https_only          = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    minimum_tls_version = "1.2"
    always_on           = var.always_on
    ftps_state          = "Disabled"

    application_stack {
      python_version = var.python_version
    }
  }

  app_settings = merge({
    "WEBSITE_RUN_FROM_PACKAGE"       = "1"
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
  }, var.app_settings)

  tags = var.tags
}
