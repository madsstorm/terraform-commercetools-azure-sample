resource "random_id" "this" {
  byte_length = 4
}

resource "azurerm_storage_account" "this" {
    name = "st-${var.name}-${random_id.this.hex}"
    resource_group_name = var.resource_group_name
    location = var.location
    account_kind = var.storage_account_kind
    account_tier = var.storage_account_tier
    account_replication_type = var.storage_account_replication_type    
}

resource "azurerm_app_service_plan" "this" {
    name = "plan-${var.name}-${random_id.this.hex}"
    location = var.location
    resource_group_name = var.resource_group_name
    kind = var.service_plan_kind

    sku {
        tier = var.service_plan_tier
        size = var.service_plan_size
    }
}

resource "azurerm_function_app" "this" {
    name = "func-${var.name}-${random_id.this.hex}"
    location = var.location
    resource_group_name = var.resource_group_name
    app_service_plan_id = azurerm_app_service_plan.this.id
    storage_account_name = azurerm_storage_account.this.name
    storage_account_access_key = azurerm_storage_account.this.primary_access_key
    version = "3"
       
    connection_string {
      name = "ServiceBusConnection"
      type = "ServiceBus"
      value = var.servicebus_connection_string
    }
}