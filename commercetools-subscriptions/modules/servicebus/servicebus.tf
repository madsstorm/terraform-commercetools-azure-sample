resource "azurerm_servicebus_namespace" "this" {
  name = "sb-${var.name}-${var.environment}"
  
  resource_group_name = var.resource_group_name
  location = var.location

  sku = var.servicebus_sku
}

resource "azurerm_servicebus_namespace_authorization_rule" "this" {
  name                = "listen_only"
  namespace_name      = azurerm_servicebus_namespace.this.name
  resource_group_name = var.resource_group_name

  listen = true
  send   = false
  manage = false
}