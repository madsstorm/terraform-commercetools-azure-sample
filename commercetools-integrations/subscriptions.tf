##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.46.1"
    }
    random = {
      source = "hashicorp/random"
      version = "3.0.1"
    }
      commercetools = {
      source = "labd/commercetools"
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
# RESOURCES
##################################################################################
resource "random_string" "resource_code" {
  length = 6
  special = false
  upper = false
}

resource "azurerm_resource_group" "subscriptions" {
    name = "rg-${var.project}-subs-${var.environment}-${random_string.resource_code.result}"
    location = var.location   
}

module "subscriptions_function_app" {
    source = "./modules/function-app"

    location = azurerm_resource_group.subscriptions.location
    environment = var.environment

    name = "subs"
    resource_group_name = azurerm_resource_group.subscriptions.name
    
    storage_account_kind = var.storage_account_kind
    storage_account_tier = var.storage_account_tier
    storage_account_replication_type = var.storage_account_replication_type

    service_plan_kind = var.subscriptions_service_plan_kind
    service_plan_tier = var.subscriptions_service_plan_tier
    service_plan_size = var.subscriptions_service_plan_size

    servicebus_connection_string = module.servicebus.namespace_listen_connection_string
}

module "subscriptions_servicebus" {
    source = "./modules/servicebus"

    location = azurerm_resource_group.subscriptions.location
    environment = var.environment

    name = "subs"
    resource_group_name = azurerm_resource_group.subscriptions.name

    servicebus_sku = var.subscriptions_servicebus_sku
}

module "order_created_topic" {
    source = "./modules/topic-subscriptions"
    
    resource_group_name = azurerm_resource_group.subscriptions.name
    namespace_name      = module.servicebus.namespace_name

    topic_name = "order_created"
    subscription_names = ["send_customer_email",  "send_order_to_backend"]
}

resource "commercetools_subscription" "order_created_subscription" {
  key = "order_created_subscription"

  destination = {
    type          = "azure_servicebus"
    connection_string = module.order_created_topic.topic_send_connection_string
  }
 
  message {
    resource_type_id = "order"
    types            = ["OrderCreated"]
  }
}

module "product_published_topic" {
    source = "./modules/topic-subscriptions"
    
    resource_group_name = azurerm_resource_group.subscriptions.name
    namespace_name      = module.servicebus.namespace_name

    topic_name = "product_published"
    subscription_names = ["update_product"]
}

resource "commercetools_subscription" "product_published_subscription" {
  key = "product_published_subscription"

  destination = {
    type          = "azure_servicebus"
    connection_string = module.product_published_topic.topic_send_connection_string
  }
 
  message {
    resource_type_id = "product"
    types            = ["ProductPublished"]
  }
}