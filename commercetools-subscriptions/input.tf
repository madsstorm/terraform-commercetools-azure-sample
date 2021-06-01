variable "location" {}
variable "environment" {}

variable "CTP_PROJECT_KEY" {}

variable "api_extensions_service_plan_kind" {
    default = "elastic"
}
variable "api_extensions_service_plan_tier" {
    default = "ElasticPremium"
}
variable "api_extensions_service_plan_size" {
    default = "EP1"
}

# Dev/Stage
#   "api_extensions_service_plan_kind" = "FunctionApp"
#   "api_extensions_service_plan_tier" = "Dynamic"
#   "api_extensions_service_plan_size" = "Y1"
