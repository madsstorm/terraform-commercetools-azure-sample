variable "resource_group_name" {}
variable "namespace_name" {}

variable "topic_name" {}
variable "subscription_names" {
    type = list(string)
}