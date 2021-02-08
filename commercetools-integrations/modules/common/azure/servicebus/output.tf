output "namespace_listen_connection_string" {
    value = azurerm_servicebus_namespace_authorization_rule.listen.primary_connection_string
}