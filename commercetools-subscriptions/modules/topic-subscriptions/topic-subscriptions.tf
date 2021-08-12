resource "azurerm_servicebus_topic" "topic" {
  name                = var.topic_name
  resource_group_name = var.resource_group_name
  namespace_name      = var.namespace_name

  max_size_in_megabytes = 5120
  default_message_ttl   = "P14D"

  enable_batched_operations = false
  enable_express            = false
  enable_partitioning       = false

  requires_duplicate_detection = false
  support_ordering             = false
}

resource "azurerm_servicebus_topic_authorization_rule" "policy" {
  name                = "send_only"
  namespace_name      = var.namespace_name
  topic_name          = azurerm_servicebus_topic.topic.name
  resource_group_name = var.resource_group_name
  listen              = false
  send                = true
  manage              = false
}

resource "azurerm_servicebus_subscription" "subscriptions" {
  for_each = var.subscription_names

  name                = each.key
  resource_group_name = var.resource_group_name
  namespace_name      = var.namespace_name
  topic_name          = azurerm_servicebus_topic.topic.name

  default_message_ttl = "P14D"
  lock_duration       = "PT5M"
  max_delivery_count  = 100

  dead_lettering_on_message_expiration = true
  enable_batched_operations            = false
  requires_session                     = false
}
