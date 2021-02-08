##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.46.1"
    }
    commercetools = {
      source = "labd/commercetools"
      version = "0.26.1"
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

module "subscriptions" {
  source = "./modules/project/subscriptions"
  
  location = var.location
  environment = var.environment

  resource_group_name = azurerm_resource_group.this.name

  storage_account_kind = var.storage_account_kind
  storage_account_tier = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

  servicebus_sku = var.subscriptions_servicebus_sku

  service_plan_kind = var.subscriptions_service_plan_kind
  service_plan_tier = var.subscriptions_service_plan_tier
  service_plan_size = var.subscriptions_service_plan_size
}

module "api-extensions" {
  source = "./modules/project/api-extensions"

  location = var.location
  environment = var.environment

  resource_group_name = azurerm_resource_group.this.name

  storage_account_kind = var.storage_account_kind
  storage_account_tier = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

  service_plan_kind = var.api_extensions_service_plan_kind
  service_plan_tier = var.api_extensions_service_plan_tier
  service_plan_size = var.api_extensions_service_plan_size
}