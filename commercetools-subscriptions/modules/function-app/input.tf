variable "location" {}
variable "environment" {}

variable "name" {}
variable "resource_group_name" {}

variable "servicebus_connection_string" {}

variable "api_client_id" {}
variable "api_client_secret" {}
variable "api_scopes" {
  type = list(string)
}
variable "api_project_key" {}