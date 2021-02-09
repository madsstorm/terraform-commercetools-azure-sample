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
  sku_name            = "Consumption_0"
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