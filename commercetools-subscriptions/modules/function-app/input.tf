variable "location" {}
variable "environment" {}

variable "name" {}
variable "function_app_name" {}
variable "resource_group_name" {}

variable "app_service_plan_id" {}
variable "servicebus_connection_string" {}

variable "ctp_project_key" {}
variable "ctp_client_id" {}
variable "ctp_client_secret" {}
variable "ctp_api_url" {}
variable "ctp_auth_url" {}
variable "ctp_scopes" {
  type = list(string)
}
