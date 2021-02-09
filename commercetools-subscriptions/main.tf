##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.46.1"
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
# LOCALS
##################################################################################
locals {
  project = "commercetools-subscriptions"
}

##################################################################################
# RESOURCES
##################################################################################
resource "azurerm_resource_group" "this" {
    name = "${local.project}-${var.environment}"
    location = var.location   
}

module "function_app" {
    source = "./modules/function-app"

    location = azurerm_resource_group.this.location
    environment = var.environment

    name = "ctsubs"
    resource_group_name = azurerm_resource_group.this.name
    
    servicebus_connection_string = module.servicebus.namespace_listen_connection_string
}

module "servicebus" {
    source = "./modules/servicebus"

    location = azurerm_resource_group.this.location
    environment = var.environment

    name = "ctsubs"
    resource_group_name = azurerm_resource_group.this.name
}

module "order_created_topic" {
    source = "./modules/topic-subscriptions"
    
    resource_group_name = azurerm_resource_group.this.name
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
    
    resource_group_name = azurerm_resource_group.this.name
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