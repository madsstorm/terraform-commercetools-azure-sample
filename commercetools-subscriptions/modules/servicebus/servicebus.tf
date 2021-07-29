resource "azurerm_servicebus_namespace" "this" {
  name = "${var.name}"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = {}

  sku = "Standard"
}

resource "azurerm_servicebus_namespace_authorization_rule" "this" {
  name                = "listen_only"
  namespace_name      = azurerm_servicebus_namespace.this.name
  resource_group_name = var.resource_group_name

  listen = true
  send   = false
  manage = false
}