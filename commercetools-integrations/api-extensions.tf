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
# RESOURCES
##################################################################################
resource "random_string" "resource_code" {
  length = 6
  special = false
  upper = false
}

resource "azurerm_resource_group" "api_extensions" {
    name = "rg-${var.project}-subs-${var.environment}-${random_string.resource_code.result}"
    location = var.location   
}

module "api_extension_function_app" {
    source = "./modules/function-app"

    location = azurerm_resource_group.api_extensions.location
    environment = var.environment

    name = "apiext"
    resource_group_name = azurerm_resource_group.api_extensions.name

    storage_account_kind = var.storage_account_kind
    storage_account_tier = var.storage_account_tier
    storage_account_replication_type = var.storage_account_replication_type

    service_plan_kind = var.api_extensions_service_plan_kind
    service_plan_tier = var.api_extensions_service_plan_tier
    service_plan_size = var.api_extensions_service_plan_size

    servicebus_connection_string = ""
}
