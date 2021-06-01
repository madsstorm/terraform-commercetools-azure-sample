resource "azurerm_storage_account" "this" {
  name                = "st${var.name}${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"

  allow_blob_public_access  = false
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
}

resource "azurerm_application_insights" "this" {
  name                = "appi-func-${var.name}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

resource "azurerm_function_app" "this" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = azurerm_storage_account.this.name
  storage_account_access_key = azurerm_storage_account.this.primary_access_key

  enable_builtin_logging = true
  version                = "~3"

  app_settings = {
    "AzureWebJobsServiceBus"                = var.servicebus_connection_string
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.this.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.this.connection_string
    "CTP_CLIENT_ID"                         = var.api_client_id
    "CTP_CLIENT_SECRET"                     = var.api_client_secret
    "CTP_PROJECT_KEY"                       = var.api_project_key
    "CTP_SCOPES"                            = join(" ", var.api_scopes)
  }
}
