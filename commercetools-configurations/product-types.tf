resource "commercetools_product_type" "mobile_broadband_subscription" {
  name        = "Mobile broadband subscription"
  description = "Subscriptions for mobile broadband"
  key         = "mobile-broadband-subscription"

  attribute {
    name = "prices_reference"
    label = {
      da = "Priser"
      en = "Prices"
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
    name = "relations_reference"
    label = {
      da = "Relationer"
      en = "Relations"
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
    name = "prices_reference"
    label = {
      da = "Priser"
      en = "Prices"
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
    name = "relations_reference"
    label = {
      da = "Relationer"
      en = "Relations"
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
    name = "prices_reference"
    label = {
      da = "Priser"
      en = "Prices"
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
    name = "relations_reference"
    label = {
      da = "Relationer"
      en = "Relations"
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

resource "commercetools_custom_object" "my-value" {
  container = "my-container"
  key       = "my-key"
  value     = jsonencode(10)
}