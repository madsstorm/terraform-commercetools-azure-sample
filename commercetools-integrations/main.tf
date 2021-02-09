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
      commercetools = {
      source = "labd/commercetools"
      version = "0.26.1"
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
resource "random_string" "resource_code" {
  length = 6
  special = false
  upper = false
}