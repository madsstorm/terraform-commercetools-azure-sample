resource "azurerm_api_management_api_diagnostic" "this" {
  identifier               = "applicationinsights"
  resource_group_name      = var.resource_group_name
  api_management_name      = var.api_management_name
  api_name                 = var.api_name
  api_management_logger_id = var.api_management_logger_id

  sampling_percentage       = 0.0
  always_log_errors         = true
  log_client_ip             = false
  verbosity                 = "verbose"
  http_correlation_protocol = "W3C"
}