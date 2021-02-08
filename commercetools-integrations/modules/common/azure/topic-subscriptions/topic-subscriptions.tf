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

resource "azurerm_servicebus_topic" "topic" {
    name                = var.topic_name
    resource_group_name = var.resource_group_name
    namespace_name      = var.namespace_name
}

resource "azurerm_servicebus_subscription" "subscriptions" {
    for_each = var.subscription_names

    name = each.key
    resource_group_name = var.resource_group_name
    namespace_name      = module.servicebus.namespace_name
    topic_name          = azurerm_servicebus_topic.topic.name
    max_delivery_count  = 100
}
