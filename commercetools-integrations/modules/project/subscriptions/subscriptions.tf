##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
      commercetools = {
      source = "labd/commercetools"
      version = "0.26.1"
    }
  }
}

module "function-app" {
    source = "../../common/azure/function-app"

    location = var.location
    environment = var.environment

    name = "subs"
    resource_group_name = var.resource_group_name
    
    storage_account_kind = var.storage_account_kind
    storage_account_tier = var.storage_account_tier
    storage_account_replication_type = var.storage_account_replication_type

    service_plan_kind = var.service_plan_kind
    service_plan_tier = var.service_plan_tier
    service_plan_size = var.service_plan_size

    servicebus_connection_string = module.servicebus.namespace_listen_connection_string
}

module "servicebus" {
    source = "../../common/azure/servicebus"

    location = var.location
    environment = var.environment

    name = "subs"
    resource_group_name = var.resource_group_name

    servicebus_sku = var.servicebus_sku
}

resource "azurerm_servicebus_topic" "order_created" {
  name                = "order_created"
  resource_group_name = var.resource_group_name
  namespace_name      = module.servicebus.namespace_name
}

resource "azurerm_servicebus_topic_authorization_rule" "order_created" {
  name                = "SendOnly"
  namespace_name      = module.servicebus.namespace_name
  topic_name          = azurerm_servicebus_topic.order_created.name
  resource_group_name = var.resource_group_name
  listen              = false
  send                = true
  manage              = false
}

resource "azurerm_servicebus_subscription" "send_customer_email" {
  name                = "send_customer_email"
  resource_group_name = var.resource_group_name
  namespace_name      = module.servicebus.namespace_name
  topic_name          = azurerm_servicebus_topic.order_created.name
  max_delivery_count  = 100
}

resource "azurerm_servicebus_subscription" "send_order_to_backend" {
  name                = "send_order_to_backend"
  resource_group_name = var.resource_group_name
  namespace_name      = module.servicebus.namespace_name
  topic_name          = azurerm_servicebus_topic.order_created.name
  max_delivery_count  = 100
}

resource "commercetools_subscription" "order_created_subscription" {
  key = "order_created_subscription"

  destination = {
    type          = "azure_servicebus"
    connection_string = azurerm_servicebus_topic_authorization_rule.order_created.primary_connection_string
  }
 
  message {
    resource_type_id = "order"
    types            = ["OrderCreated"]
  }
}

