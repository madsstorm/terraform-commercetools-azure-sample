output "topic_send_connection_string" {
  value = azurerm_servicebus_topic_authorization_rule.policy.primary_connection_string
}
