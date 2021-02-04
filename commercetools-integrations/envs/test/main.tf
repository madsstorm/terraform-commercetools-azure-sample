terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.45.1"
    }
  }
}

provider "azurerm" {    
}

module "subscriptions-function-app" {
    source = "../../modules/common/azure/function-app"

    location = var.location
    resource_group_name = var.resource_group_name

    storage_account_name = var.subscriptions_storage_account_name
    storage_account_tier = var.subscriptions_storage_account_tier
    storage_account_replication_type = var.subscriptions_storage_account_replication_type

    service_plan_name = var.subscriptions_service_plan_name
    service_plan_kind = var.subscriptions_service_plan_kind
    service_plan_tier = var.subscriptions_service_plan_tier
    service_plan_size = var.subscriptions_service_plan_size

    function_app_name = var.subscriptions_function_app_name
}

module "api-extensions-function-app" {
    source = "../../modules/common/azure/function-app"

    location = var.location
    resource_group_name = var.resource_group_name

    storage_account_name = var.api_extensions_storage_account_name
    storage_account_tier = var.api_extensions_storage_account_tier
    storage_account_replication_type = var.api_extensions_storage_account_replication_type

    service_plan_name = var.api_extensions_service_plan_name
    service_plan_kind = var.api_extensions_service_plan_kind
    service_plan_tier = var.api_extensions_service_plan_tier
    service_plan_size = var.api_extensions_service_plan_size
    
    function_app_name = var.api_extensions_function_app_name
}
