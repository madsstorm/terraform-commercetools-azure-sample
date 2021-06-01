##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.50.0"
    }
    commercetools = {
      source  = "labd/commercetools"
      version = "0.28.0"
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
# RESOURCES
##################################################################################
resource "azurerm_resource_group" "commercetools_integrations" {
  name     = "commercetools-integrations-${var.environment}"
  location = var.location
}

resource "commercetools_api_client" "integrations_client" {
  name  = "Integrations Client"
  scope = ["view_products:${var.CTP_PROJECT_KEY}","view_orders:${var.CTP_PROJECT_KEY}","view_categories:${var.CTP_PROJECT_KEY}"]
}
