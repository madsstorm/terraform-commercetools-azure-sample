resource "azurerm_api_management_api" "commerce" {
  name                = "commerce"
  display_name        = "Commerce API"
  resource_group_name = azurerm_resource_group.this.name
  api_management_name = azurerm_api_management.this.name

  path        = "commerce"
  protocols   = ["https"]
  service_url = var.CTP_API_URL

  revision              = "1"
  subscription_required = false
}

resource "azurerm_api_management_api_operation" "commerce_get" {
  operation_id        = "commerce-get"
  api_name            = azurerm_api_management_api.commerce.name
  api_management_name = azurerm_api_management.this.name
  resource_group_name = azurerm_resource_group.this.name

  display_name = "/*"
  method       = "GET"
  url_template = "/*"
}

resource "azurerm_api_management_api_operation" "commerce_post" {
  operation_id        = "commerce-post"
  api_name            = azurerm_api_management_api.commerce.name
  api_management_name = azurerm_api_management.this.name
  resource_group_name = azurerm_resource_group.this.name

  display_name = "/*"
  method       = "POST"
  url_template = "/*"
}

module "commerce_diagnostic" {
  source                   = "./modules/api-diagnostic"
  resource_group_name      = azurerm_resource_group.this.name
  api_management_name      = azurerm_api_management.this.name
  api_name                 = azurerm_api_management_api.commerce.name
  api_management_logger_id = azurerm_api_management_logger.this.id
}
