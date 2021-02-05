module "function-app" {
    source = "../../common/azure/function-app"

    location = var.location
    environment = var.environment

    name = "subs"
    resource_group_name = var.resource_group_name
    
    storage_account_kind = var.storage_account_kind
    storage_account_tier = var.storage_account_tier
    storage_account_replication_type = var.storage_account_replication_type

    service_plan_kind = var.service_plan_kind
    service_plan_tier = var.service_plan_tier
    service_plan_size = var.service_plan_size

    servicebus_connection_string = ""
}