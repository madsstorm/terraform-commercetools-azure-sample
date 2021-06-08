locals {
  function_app_apiextensions_name = "func-commercetools-apiextensions-${var.azure_environment}"
}

module "function_app_apiextensions" {
  source = "./modules/function-app"

  location    = azurerm_resource_group.commercetools_integrations.location
  environment = var.azure_environment

  name                 = "commercetools-apiextensions"
  function_app_name    = local.function_app_apiextensions_name
  storage_account_name = "tlmctapiextfunc${var.azure_environment}"
  resource_group_name  = azurerm_resource_group.commercetools_integrations.name
  
  app_service_plan_id          = azurerm_app_service_plan.commercetools_integrations.id
  servicebus_connection_string = ""

  ctp_client_id     = commercetools_api_client.integrations_client.id
  ctp_client_secret = commercetools_api_client.integrations_client.secret
  ctp_scopes        = commercetools_api_client.integrations_client.scope
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

resource "commercetools_api_extension" "validate_cart_limits" {
  key = "validate-cart-limits"

  destination = {
    type = "HTTP"
    url = "https://${module.function_app_apiextensions.function_app_hostname}/ValidateCartLimits"
    azure_authentication = data.azurerm_function_app_host_keys.apiextensions.default_function_key
  }

  trigger {
    resource_type_id = "cart"
    actions          = ["Update"]
  }
}

resource "commercetools_api_extension" "set_lineitem_groupid" {
  key = "set-lineitem-groupid"

  destination = {
    type = "HTTP"
    url = "https://${module.function_app_apiextensions.function_app_hostname}/SetLineItemGroupId"
    azure_authentication = data.azurerm_function_app_host_keys.apiextensions.default_function_key
  }

  trigger {
    resource_type_id = "cart"
    actions          = ["Update"]
  }
}

resource "commercetools_api_extension" "set_lineitem_distributionchannel" {
  key = "set-lineitem-distributionchannel"

  destination = {
    type = "HTTP"
    url = "https://${module.function_app_apiextensions.function_app_hostname}/SetLineItemDistributionChannel"
    azure_authentication = data.azurerm_function_app_host_keys.apiextensions.default_function_key
  }

  trigger {
    resource_type_id = "cart"
    actions          = ["Update"]
  }
}

resource "commercetools_api_extension" "set_ordernumber" {
  key = "set-ordernumber"

  destination = {
    type = "HTTP"
    url = "https://${module.function_app_apiextensions.function_app_hostname}/SetOrdernumber"
    azure_authentication = data.azurerm_function_app_host_keys.apiextensions.default_function_key
  }

  trigger {
    resource_type_id = "order"
    actions          = ["Create"]
  }
}