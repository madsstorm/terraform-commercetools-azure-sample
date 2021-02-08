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

# module "order_created_topic" {
#     source = "../../common/azure/topic-subscriptions"
    
#     resource_group_name = var.resource_group_name
#     namespace_name      = module.servicebus.namespace_name

#     topic_name = "order_created"
#     subscription_names = ["send_customer_email",  "send_order_to_backend"]
# }

# resource "commercetools_subscription" "order_created_subscription" {
#   key = "order_created_subscription"

#   destination = {
#     type          = "azure_servicebus"
#     connection_string = module.order_created_topic.topic_send_connection_string
#   }
 
#   message {
#     resource_type_id = "order"
#     types            = ["OrderCreated"]
#   }
# }

# module "product_published_topic" {
#     source = "../../common/azure/topic-subscriptions"
    
#     resource_group_name = var.resource_group_name
#     namespace_name      = module.servicebus.namespace_name

#     topic_name = "product_published"
#     subscription_names = ["update_product"]
# }

# resource "commercetools_subscription" "product_published_subscription" {
#   key = "product_published_subscription"

#   destination = {
#     type          = "azure_servicebus"
#     connection_string = module.product_published_topic.topic_send_connection_string
#   }
 
#   message {
#     resource_type_id = "product"
#     types            = ["ProductPublished"]
#   }
# }