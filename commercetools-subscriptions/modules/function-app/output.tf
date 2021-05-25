output "function_app_hostkey" {
  value = azurerm_function_app_host_keys.this.default_function_key
}

output "function_app_hostname" {
  value = azurerm_function_app.this.default_hostname
}