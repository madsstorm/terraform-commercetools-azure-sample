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

resource "azurerm_api_management" "this" {
  name = "apim-${var.project}-${var.environment}-${random_string.resource_code.result}"
  location = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  publisher_email = "madsstorm@gmail.com"
  publisher_name = "Mads Storm Hansen"

  sku_name = var.api_management_sku_name 
}