variable "azure_location" {
    default = "West Europe"
}
variable "azure_environment" {}

variable "commercetools_project_key" {}

variable "commercetools_api_url" {
    description = "API URL with trailing slash"
}
variable "commercetools_auth_url" {
    description = "Auth URL with trailing slash"
}