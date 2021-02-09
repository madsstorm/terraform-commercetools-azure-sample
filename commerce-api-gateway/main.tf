##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.46.1"
    }
  }
}

##################################################################################
# PROVIDERS
##################################################################################
provider "azurerm" {
  features {}
}

##################################################################################
# LOCALS
##################################################################################
locals {
  project = "commerce-api-gateway"
}

##################################################################################
# RESOURCES
##################################################################################
resource "azurerm_resource_group" "this" {
  name     = "${local.project}-${var.environment}"
  location = var.location
}

resource "azurerm_api_management" "this" {
  name                = "apim-${local.project}-${var.environment}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  publisher_email     = "madsstorm@gmail.com"
  publisher_name      = "Mads Storm Hansen"
  sku_name            = var.api_management_sku_name
}

resource "azurerm_api_management_api" "products" {
  name                = "products"
  resource_group_name = azurerm_resource_group.this.name
  api_management_name = azurerm_api_management.this.name
  revision            = "1"
  display_name        = "Products API"
  path                = "products"
  protocols           = ["https"]
  service_url         = "https://api.example.com/products"
}

resource "azurerm_application_insights" "this" {
  name                = "appi-${local.project}-${var.environment}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  application_type    = "web"
}

resource "azurerm_api_management_logger" "this" {
  name                = "log-${local.project}-${var.environment}"
  api_management_name = azurerm_api_management.this.name
  resource_group_name = azurerm_resource_group.this.name

  application_insights {
    instrumentation_key = azurerm_application_insights.this.instrumentation_key
  }
}

resource "azurerm_api_management_api_diagnostic" "products-diagnostics" {
  identifier               = "applicationinsights"
  resource_group_name      = azurerm_resource_group.this.name
  api_management_name      = azurerm_api_management.this.name
  api_name                 = azurerm_api_management_api.products.name
  api_management_logger_id = azurerm_api_management_logger.this.id

  sampling_percentage       = 5.0
  always_log_errors         = true
  log_client_ip             = true
  verbosity                 = "verbose"
  http_correlation_protocol = "W3C"

  frontend_request {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "accept",
      "origin",
    ]
  }

  frontend_response {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "content-length",
      "origin",
    ]
  }

  backend_request {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "accept",
      "origin",
    ]
  }

  backend_response {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "content-length",
      "origin",
    ]
  }
}