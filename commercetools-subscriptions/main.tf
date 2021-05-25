##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.46.1"
    }
    commercetools = {
      source  = "labd/commercetools"
      version = "0.26.1"
    }
  }
}

##################################################################################
# PROVIDERS
##################################################################################
provider "azurerm" {
  features {}
}

##################################################################################
# LOCALS
##################################################################################
locals {
  project = "commercetools-integrations"
}

##################################################################################
# RESOURCES
##################################################################################
resource "azurerm_resource_group" "this" {
  name     = "${local.project}-${var.environment}"
  location = var.location
}

module "servicebus" {
  source = "./modules/servicebus"

  location    = azurerm_resource_group.this.location
  environment = var.environment

  name                = "ctsubs"
  resource_group_name = azurerm_resource_group.this.name
}

resource "commercetools_api_client" "integrations_client" {
  name  = "Integrations Client"
  scope = ["view_products:${var.CTP_PROJECT_KEY}","view_orders:${var.CTP_PROJECT_KEY}","view_categories:${var.CTP_PROJECT_KEY}"]
}

module "function_app" {
  source = "./modules/function-app"

  location    = azurerm_resource_group.this.location
  environment = var.environment

  name                = "ctsubs"
  resource_group_name = azurerm_resource_group.this.name

  servicebus_connection_string = module.servicebus.namespace_listen_connection_string

  api_client_id     = commercetools_api_client.integrations_client.id
  api_client_secret = commercetools_api_client.integrations_client.secret
  api_scopes        = commercetools_api_client.integrations_client.scope
  api_project_key   = var.CTP_PROJECT_KEY
}

module "order_created_topic" {
  source = "./modules/topic-subscriptions"

  resource_group_name = azurerm_resource_group.this.name
  namespace_name      = module.servicebus.namespace_name

  topic_name         = "order_created"
  subscription_names = ["send_order_to_backend"]
}

resource "commercetools_subscription" "order_created_subscription" {
  key = "order_created_subscription"

  destination = {
    type              = "azure_servicebus"
    connection_string = module.order_created_topic.topic_send_connection_string
  }

  message {
    resource_type_id = "order"
    types            = ["OrderCreated"]
  }
}

resource "commercetools_api_extension" "validate_cart_limits" {
  key = "validate-cart-limits"

  destination {
    type = "HTTP"
    url = "https://${module.function_app.function_app_hostname}/ValidateCartLimits"
    azure_authentication = module.function_app.function_app_hostkey
  }

  trigger {
    resource_type_id = "cart"
    actions          = ["Update"]
  }
}

resource "commercetools_api_extension" "update_lineitems" {
  key = "update-lineitems"

  destination {
    type = "HTTP"
    url = "https://${module.function_app.function_app_hostname}/UpdateLineitems"
    azure_authentication = module.function_app.function_app_hostkey
  }

  trigger {
    resource_type_id = "cart"
    actions          = ["Update"]
  }
}

resource "commercetools_api_extension" "generate_ordernumber" {
  key = "generate-ordernumber"

  destination {
    type = "HTTP"
    url = "https://${module.function_app.function_app_hostname}/GenerateOrdernumber"
    azure_authentication = module.function_app.function_app_hostkey
  }

  trigger {
    resource_type_id = "order"
    actions          = ["Create"]
  }
}