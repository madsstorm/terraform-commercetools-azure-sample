resource "commercetools_product_type" "mobile_broadband_subscription" {
  name        = "Mobile broadband subscription"
  description = "Subscriptions for mobile broadband"
  key         = "mobile-broadband-subscription"
}

resource "commercetools_product_type" "mobile_broadband_hardware" {
  name        = "Mobile broadband hardware"
  description = "Hardware for mobile broadband subscriptions"
  key         = "mobile-broadband-hardware"
}

resource "commercetools_product_type" "service_option" {
  name        = "Service option"
  description = "Options for services"
  key         = "service-option"
}