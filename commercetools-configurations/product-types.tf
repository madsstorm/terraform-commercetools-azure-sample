resource "commercetools_product_type" "mobile_broadband_subscription" {
  name        = "Mobile broadband subscription"
  description = "Subscriptions for mobile broadband"
  key         = "mobile-broadband-subscription"

  attribute {
    name = "product_price_relations"
    label = {
      da = "Prisrelationer"
      en = "Pricerelations"
    }
    required   = false
    constraint = "SameForAll"
    searchable = false
    type {
      name           = "nested"
      type_reference = commercetools_product_type.product_price_relations.id
    }
  }
}

resource "commercetools_product_type" "mobile_broadband_hardware" {
  name        = "Broadband hardware"
  description = "Hardware for mobile broadband subscriptions"
  key         = "mobile-broadband-hardware"

  attribute {
    name = "product_price_relations"
    label = {
      da = "Prisrelationer"
      en = "Pricerelations"
    }
    required   = false
    constraint = "SameForAll"
    searchable = false
    type {
      name           = "nested"
      type_reference = commercetools_product_type.product_price_relations.id
    }
  }
}

resource "commercetools_product_type" "service_option" {
  name        = "Service option"
  description = "Options for services"
  key         = "service-option"

  attribute {
    name = "product_price_relations"
    label = {
      da = "Prisrelationer"
      en = "Pricerelations"
    }
    required   = false
    constraint = "SameForAll"
    searchable = false
    type {
      name           = "nested"
      type_reference = commercetools_product_type.product_price_relations.id
    }
  }
}

resource "commercetools_custom_object" "my-value" {
  container = "my-container"
  key       = "my-key"
  value     = jsonencode(10)
}