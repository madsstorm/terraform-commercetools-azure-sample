##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.46.1"
    }
    random = {
      source = "hashicorp/random"
      version = "3.0.1"
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
}

##################################################################################
# RESOURCES
##################################################################################
resource "random_string" "resource_code" {
  length = 6
  special = false
  upper = false
}

resource "azurerm_resource_group" "this" {
    name = "rg-${var.project}-${var.environment}-${random_string.resource_code.result}"
    location = var.location
}

resource "azurerm_application_insights" "this" {
  name = "appi-${var.project}-${var.environment}-${random_string.resource_code.result}"
  location = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  application_type = "web"  
}

resource "azurerm_api_management" "this" {
  name = "apim-${var.project}-${var.environment}-${random_string.resource_code.result}"
  location = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  publisher_email = "madsstorm@gmail.com"
  publisher_name = "Mads Storm Hansen"
  sku_name = var.api_management_sku_name  
}

resource "azurerm_api_management_logger" "this" {
  name = "log-${var.project}-${var.environment}-${random_string.resource_code.result}"
  api_management_name = azurerm_api_management.this.name
  resource_group_name = azurerm_resource_group.this.name

  application_insights {
    instrumentation_key = azurerm_application_insights.this.instrumentation_key
  }
}

resource "azurerm_api_management_diagnostic" "this" {
  identifier = "applicationinsights"
  resource_group_name = azurerm_resource_group.this.name
  api_management_name = azurerm_api_management.this.name
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