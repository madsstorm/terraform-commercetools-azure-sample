resource "azurerm_resource_group" "this" {
    name = var.resource_group_name
    location = var.location
}

resource "azurerm_storage_account" "this" {
    name = var.storage_account_name
    resource_group_name = azurerm_resource_group.this.name
    location = azurerm_resource_group.this.location
    account_tier = var.storage_account_tier
    account_replication_type = var.storage_account_replication_type    
}

resource "azurerm_app_service_plan" "this" {
    name = var.service_plan_name
    location = azurerm_resource_group.this.location
    resource_group_name = azurerm_resource_group.this.name
    kind = var.service_plan_kind

    sku {
        tier = var.service_plan_tier
        size = var.service_plan_size
    }
}

resource "azurerm_function_app" "this" {
    name = var.function_app_name
    location = azurerm_resource_group.this.location
    resource_group_name = azurerm_resource_group.this.name
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