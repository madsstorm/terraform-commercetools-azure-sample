resource "commercetools_product_type" "mobile_broadband_subscription" {
  name        = "Mobile broadband subscription"
  description = "Subscriptions for mobile broadband"
  key         = "mobile-broadband-subscription"

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

resource "commercetools_product_type" "mobile_broadband_hardware" {
  name        = "Broadband hardware"
  description = "Hardware for mobile broadband subscriptions"
  key         = "mobile-broadband-hardware"

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

resource "commercetools_product_type" "service_option" {
  name        = "Service option"
  description = "Options for services"
  key         = "service-option"

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