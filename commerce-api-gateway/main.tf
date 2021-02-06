##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.45.1"
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
  sampling_percentage = 5.0
  resource_group_name = azurerm_resource_group.this.name
  api_management_name = azurerm_api_management.this.name
  api_management_logger_id = azurerm_api_management_logger.this.id
}