output "namespace_name" {
    value = azurerm_servicebus_namespace.this.name
}

output "namespace_listen_connection_string" {
    value = azurerm_servicebus_namespace_authorization_rule.this.primary_connection_string
}