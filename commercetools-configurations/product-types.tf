resource "commercetools_product_type" "mobile_broadband_subscription" {
  name        = "Mobile broadband subscription"
  description = "Subscriptions for mobile broadband"
  key         = "mobile-broadband-subscription"

  attribute {
    name = "product_prices_relations"
    label = {
      da = "Priser og relationer"
      en = "Prices and relations"
    }
    required   = false
    searchable = false
    type {
      name           = "nested"
      type_reference = commercetools_product_type.product_prices_relations.id
    }
  }
}

resource "commercetools_product_type" "mobile_broadband_hardware" {
  name        = "Broadband hardware"
  description = "Hardware for mobile broadband subscriptions"
  key         = "mobile-broadband-hardware"
}

resource "commercetools_product_type" "service_option" {
  name        = "Service option"
  description = "Options for services"
  key         = "service-option"
}

resource "commercetools_product_type" "product_prices_relations" {
  name        = "Product prices and relations"
  description = "Prices and relations for products"
  key         = "product-prices-relations"

  attribute {
    name = "variant_prices_reference"
    label = {
      da = "Variant priser"
      en = "Variant prices"
    }
    required   = false
    constraint = "None"
    searchable = false
    type {
      name              = "reference"
      reference_type_id = "key-value-document"
    }
  }

  attribute {
    name = "product_prices_reference"
    label = {
      da = "Produkt priser"
      en = "Product prices"
    }
    required   = false
    constraint = "SameForAll"
    searchable = false
    type {
      name              = "reference"
      reference_type_id = "key-value-document"
    }
  }

  attribute {
    name = "variant_relations_reference"
    label = {
      da = "Variant relationer"
      en = "Variant relations"
    }
    required   = false
    constraint = "None"
    searchable = false
    type {
      name              = "reference"
      reference_type_id = "key-value-document"
    }
  }

  attribute {
    name = "product_relations_reference"
    label = {
      da = "Produkt relationer"
      en = "Product relations"
    }
    required   = false
    constraint = "SameForAll"
    searchable = false
    type {
      name              = "reference"
      reference_type_id = "key-value-document"
    }
  }
}