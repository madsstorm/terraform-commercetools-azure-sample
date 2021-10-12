##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.62.1"
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

provider "commercetools" {
  client_id     = "LrkevCrrEVuaqlxr_kFJODtT"
  client_secret = "7NJriElCgYyhaiUmOqO69IgyNND7os5h"
  project_key   = "telmoretrial"
  scopes        = "manage_project:telmoretrial manage_api_clients:telmoretrial view_api_clients:telmoretrial"
  api_url       = "https://api.europe-west1.gcp.commercetools.com"
  token_url     = "https://auth.europe-west1.gcp.commercetools.com"
}

##################################################################################
# RESOURCES
##################################################################################
resource "azurerm_resource_group" "commercetools_integrations" {
  name     = "commercetools-integrations-${var.azure_environment}"
  location = var.azure_location
}

resource "azurerm_app_service_plan" "commercetools_integrations" {
  name                = "plan-commercetools-integrations-${var.azure_environment}"
  location            = azurerm_resource_group.commercetools_integrations.location
  resource_group_name = azurerm_resource_group.commercetools_integrations.name
  
  kind                         = "elastic"  
  maximum_elastic_worker_count = "20"

  sku {
    tier     = "ElasticPremium"
    size     = "EP1"
  }
}
