resource "azurerm_storage_account" "this" {
  name                = var.storage_account_name
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
  name                = "appi-functionapp-${var.name}-${var.environment}"
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

  https_only             = true
  enable_builtin_logging = true
  version                = "~3"

  app_settings = {
    "AzureWebJobsServiceBus"                    = var.servicebus_connection_string
    "APPINSIGHTS_INSTRUMENTATIONKEY"            = azurerm_application_insights.this.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"     = azurerm_application_insights.this.connection_string
    "CommercetoolsApi:ClientId"                 = var.ctp_client_id
    "CommercetoolsApi:ClientSecret"             = var.ctp_client_secret
    "CommercetoolsApi:ProjectKey"               = var.ctp_project_key
    "CommercetoolsApi:Scope"                    = join(" ", var.ctp_scopes)
    "CommercetoolsApi:ApiBaseAddress"           = var.ctp_api_url
    "CommercetoolsApi:AuthorizationBaseAddress" = var.ctp_auth_url
  }
}
