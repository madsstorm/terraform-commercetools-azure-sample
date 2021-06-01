variable "location" {}
variable "environment" {}

variable "name" {}
variable "function_app_name" {}
variable "resource_group_name" {}

variable "app_service_plan_id" {}
variable "servicebus_connection_string" {}

variable "api_client_id" {}
variable "api_client_secret" {}
variable "api_scopes" {
  type = list(string)
}
variable "api_project_key" {}