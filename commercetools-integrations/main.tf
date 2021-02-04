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
  name = "${var.project}-${var.environment}"
}

##################################################################################
# RESOURCES
##################################################################################
resource "random_string" "resource_code" {
  length = 5
  special = false
  upper = false
}

resource "azurerm_resource_group" "this" {
    name = "rg-${local.name}-${random_string.resource_code.result}"
    location = var.location
}

module "subscriptions" {
  source = "./modules/project/subscriptions"
  
  location = var.location

  name = "${local.name}-subs"
  resource_group_name = azurerm_resource_group.this.name

  storage_account_kind = var.storage_account_kind
  storage_account_tier = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

  service_plan_kind = var.subscriptions_service_plan_kind
  service_plan_tier = var.subscriptions_service_plan_tier
  service_plan_size = var.subscriptions_service_plan_size
}

module "api-extensions" {
  source = "./modules/project/api-extensions"

  location = var.location

  name = "${local.name}-api-ext"
  resource_group_name = azurerm_resource_group.this.name

  storage_account_kind = var.storage_account_kind
  storage_account_tier = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

  service_plan_kind = var.api_extensions_service_plan_kind
  service_plan_tier = var.api_extensions_service_plan_tier
  service_plan_size = var.api_extensions_service_plan_size
}