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
  name     = "commercetools-integrations-${var.azure_environment}"
  location = var.azure_location
}

resource "azurerm_app_service_plan" "commercetools_integrations" {
  name                = "plan-ctint-${var.azure_environment}"
  location            = azurerm_resource_group.commercetools_integrations.location
  resource_group_name = azurerm_resource_group.commercetools_integrations.name
  kind                = "elastic"

  sku {
    tier     = "ElasticPremium"
    size     = "EP1"
  }
}

resource "commercetools_api_client" "integrations_client" {
  name  = "Integrations Client"
  scope = ["view_products:${var.commercetools_project_key}","view_orders:${var.commercetools_project_key}","view_categories:${var.commercetools_project_key}"]
}
