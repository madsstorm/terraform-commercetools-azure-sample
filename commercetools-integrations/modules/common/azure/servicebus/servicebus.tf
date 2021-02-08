resource "random_string" "resource_code" {
  length = 6
  special = false
  upper = false
}

resource "azurerm_servicebus_namespace" "this" {
  name = "sb-${var.name}-${var.environment}-${random_string.resource_code.result}"
  
  resource_group_name = var.resource_group_name
  location = var.location

  sku = var.servicebus_sku
}