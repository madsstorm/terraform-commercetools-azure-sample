resource "azurerm_storage_account" "this" {
    name = "st${var.name}${var.environment}"
    resource_group_name = var.resource_group_name
    location = var.location

    account_kind = "StorageV2"
    account_tier = "Standard"
    account_replication_type = "GRS"
    access_tier = "Hot"

    enable_https_traffic_only = true
    allow_blob_public_access = false
}

resource "azurerm_app_service_plan" "this" {
    name = "plan-${var.name}-${var.environment}"
    location = var.location
    resource_group_name = var.resource_group_name
    kind = "FunctionApp"

    sku {
        tier = "Dynamic"
        size = "Y1"
    }
}

resource "azurerm_application_insights" "this" {
    name = "appi-${azurerm_function_app.this.name}"
    location = var.location
    resource_group_name = var.resource_group_name
    application_type = "web" 
}

resource "azurerm_function_app" "this" {
    name = "func-${var.name}-${var.environment}"
    location = var.location
    resource_group_name = var.resource_group_name
    app_service_plan_id = azurerm_app_service_plan.this.id
    storage_account_name = azurerm_storage_account.this.name
    storage_account_access_key = azurerm_storage_account.this.primary_access_key

    enable_builtin_logging = true
    version = "~3"

    app_settings = {
      "AzureWebJobsServiceBus" = var.servicebus_connection_string
      "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.this.instrumentation_key
    }       
}