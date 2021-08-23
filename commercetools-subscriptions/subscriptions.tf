resource "random_id" "subscriptions" {
  byte_length = 2
}

locals {
  subs_postfix = (var.azure_environment == "dev") ? random_id.subscriptions.hex : ""
}

module "servicebus" {
  source = "./modules/servicebus"

  location    = azurerm_resource_group.commercetools_integrations.location

  name                = "tlm-ctint-subs-${var.azure_environment}${local.subs_postfix}"
  resource_group_name = azurerm_resource_group.commercetools_integrations.name
}

module "order_created_topic" {
  source = "./modules/topic-subscriptions"

  resource_group_name = azurerm_resource_group.commercetools_integrations.name
  namespace_name      = module.servicebus.namespace_name

  topic_name         = "order_created"
  subscription_names = ["send_order_to_oms"]
}

module "product_published_topic" {
  source = "./modules/topic-subscriptions"

  resource_group_name = azurerm_resource_group.commercetools_integrations.name
  namespace_name      = module.servicebus.namespace_name

  topic_name         = "product_published"
  subscription_names = ["update_prices"]
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

resource "commercetools_subscription" "product_published_subscription" {
  key = "product_published_subscription"

  destination = {
    type              = "azure_servicebus"
    connection_string = module.product_published_topic.topic_send_connection_string
  }

  message {
    resource_type_id = "product"
    types            = ["ProductPublished"]
  }
}

module "function_app_subscriptions" {
  source = "./modules/function-app"

  location    = azurerm_resource_group.commercetools_integrations.location
  environment = var.azure_environment

  name                 = "commercetools-subscriptions"
  function_app_name    = "tlm-ctint-subs-${var.azure_environment}${local.subs_postfix}"
  storage_account_name = "tlmctsubsfunc${var.azure_environment}${local.subs_postfix}"
  resource_group_name  = azurerm_resource_group.commercetools_integrations.name

  app_service_plan_id          = azurerm_app_service_plan.commercetools_integrations.id
  servicebus_connection_string = module.servicebus.namespace_listen_connection_string

  ctp_client_id     = commercetools_api_client.integrations_client.id
  ctp_client_secret = commercetools_api_client.integrations_client.secret
  ctp_scopes        = commercetools_api_client.integrations_client.scope
  ctp_project_key   = var.commercetools_project_key
  ctp_api_url       = var.commercetools_api_url
  ctp_auth_url      = var.commercetools_auth_url
}
