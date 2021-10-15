resource "random_id" "apiext" {
  byte_length = 2
}

resource "commercetools_api_client" "apiextensions_api_client" {
  name  = "API Extensions Client"
  scope = ["view_products:${var.commercetools_project_key}", "view_orders:${var.commercetools_project_key}", "view_categories:${var.commercetools_project_key}"]
}

locals {
  apiext_postfix                  = (var.azure_environment == "dev") ? random_id.apiext.hex : ""
  function_app_apiextensions_name = "tlm-ctint-apiext-${var.azure_environment}${local.apiext_postfix}"
}

module "function_app_apiextensions" {
  source = "./modules/function-app"

  location    = azurerm_resource_group.commercetools_integrations.location
  environment = var.azure_environment

  name                 = "commercetools-apiextensions"
  function_app_name    = local.function_app_apiextensions_name
  storage_account_name = "tlmctapiextfunc${var.azure_environment}${local.apiext_postfix}"
  resource_group_name  = azurerm_resource_group.commercetools_integrations.name

  app_service_plan_id          = azurerm_app_service_plan.commercetools_integrations.id
  servicebus_connection_string = ""

  ctp_client_id     = commercetools_api_client.apiextensions_api_client.id
  ctp_client_secret = commercetools_api_client.apiextensions_api_client.secret
  ctp_scopes        = commercetools_api_client.apiextensions_api_client.scope
  ctp_project_key   = var.commercetools_project_key
  ctp_api_url       = var.commercetools_api_url
  ctp_auth_url      = var.commercetools_auth_url
}

data "azurerm_function_app_host_keys" "apiextensions" {
  name                = local.function_app_apiextensions_name
  resource_group_name = azurerm_resource_group.commercetools_integrations.name

  depends_on = [
    module.function_app_apiextensions
  ]
}

resource "commercetools_api_extension" "cart_update" {
  key = "cart-update"

  destination = {
    type                 = "HTTP"
    url                  = "https://${module.function_app_apiextensions.function_app_hostname}/api/CartUpdate"
    azure_authentication = data.azurerm_function_app_host_keys.apiextensions.default_function_key
  }

  trigger {
    resource_type_id = "cart"
    actions          = ["Update"]
  }
}

resource "commercetools_api_extension" "order_create" {
  key = "order-create"

  destination = {
    type                 = "HTTP"
    url                  = "https://${module.function_app_apiextensions.function_app_hostname}/api/OrderCreate"
    azure_authentication = data.azurerm_function_app_host_keys.apiextensions.default_function_key
  }

  trigger {
    resource_type_id = "order"
    actions          = ["Create"]
  }
}
