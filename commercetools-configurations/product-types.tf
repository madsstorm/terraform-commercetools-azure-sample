resource "commercetools_product_type" "device" {
  name        = "Device"
  description = "Device"
  key         = "device"

  attribute {
    name = "Brand"
    label = {
      da = "Mærke"
    }
    required   = true
    constraint = "SameForAll"
    searchable = true
    type {
      name = "enum"
      values = {
      }
    }
  }

  attribute {
    name = "ScreenSize"
    label = {
      da = "Skærmstørrelse"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "number"
    }
  }

  attribute {
    name = "5G"
    label = {
      da = "5G"
    }
    required   = true
    constraint = "SameForAll"
    searchable = true
    type {
      name = "boolean"
    }
  }

  attribute {
    name = "Storage"
    label = {
      da = "Kapacitet"
    }
    required   = true
    constraint = "None"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "ColorDescription"
    label = {
      da = "Farve"
    }
    required   = true
    constraint = "None"
    searchable = true
    type {
      name = "ltext"
    }
  }

  attribute {
    name = "FilterColor"
    label = {
      da = "Farve på filterliste"
    }
    required   = false
    constraint = "None"
    searchable = true
    type {
      name = "lenum"
      localized_value {
        key = "black"
        label = {
          da = "Sort"
        }
      }
      localized_value {
        key = "white"
        label = {
          da = "Hvid"
        }
      }
      localized_value {
        key = "red"
        label = {
          da = "Rød"
        }
      }
      localized_value {
        key = "blue"
        label = {
          da = "Blå"
        }
      }
      localized_value {
        key = "yellow"
        label = {
          da = "Gul"
        }
      }
      localized_value {
        key = "green"
        label = {
          da = "Grøn"
        }
      }
      localized_value {
        key = "gold"
        label = {
          da = "Guld"
        }
      }
      localized_value {
        key = "silver"
        label = {
          da = "Sølv"
        }
      }
    }
  }

  attribute {
    name = "InternalPrice"
    label = {
      da = "Internal price"
    }
    required   = false
    constraint = "None"
    searchable = false
    type {
      name = "money"
    }
  }

  attribute {
    name = "SubscriptionCategory"
    label = {
      da = "Abonnementskategori"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name              = "reference"
      reference_type_id = "category"
    }
  }

  attribute {
    name = "DefaultSubscription"
    label = {
      da = "Default abonnement"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name              = "reference"
      reference_type_id = "product"
    }
  }

  attribute {
    name = "AccessoryCategory"
    label = {
      da = "Tilbehørskategori"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name              = "reference"
      reference_type_id = "category"
    }
  }

  attribute {
    name = "Accessories"
    label = {
      da = "Tilbehør"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "set"
      element_type {
        name              = "reference"
        reference_type_id = "product"
      }
    }
  }

  attribute {
    name = "ValueAddedServices"
    label = {
      da = "Ekstra Services"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "set"
      element_type {
        name              = "reference"
        reference_type_id = "product"
      }
    }
  }
}

resource "commercetools_product_type" "accessory" {
  name        = "Accessory"
  description = "Accessory"
  key         = "accessory"

  attribute {
    name = "Brand"
    label = {
      da = "Brand"
    }
    required   = true
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "CompatibleProducts"
    label = {
      da = "Compatible products"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "set"
      element_type {
        name              = "reference"
        reference_type_id = "product"
      }
    }
  }

  attribute {
    name = "ColorDescription"
    label = {
      da = "Color description"
    }
    required   = true
    constraint = "None"
    searchable = true
    type {
      name = "ltext"
    }
  }

  attribute {
    name = "FilterColor"
    label = {
      da = "Filter color"
    }
    required   = false
    constraint = "None"
    searchable = true
    type {
      name = "ltext"
    }
  }

  attribute {
    name = "InternalPrice"
    label = {
      da = "Internal price"
    }
    required   = false
    constraint = "None"
    searchable = false
    type {
      name = "money"
    }
  }
}

resource "commercetools_product_type" "mobile_subscription" {
  name        = "Mobile Subscription"
  description = "Mobile Subscription"
  key         = "mobilesubscription"

  attribute {
    name = "BindingPeriod"
    label = {
      da = "Binding period"
    }
    required   = false
    constraint = "SameForAll"
    searchable = false
    type {
      name = "number"
    }
  }

  attribute {
    name = "Fees"
    label = {
      da = "Fees"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "set"
      element_type {
        name              = "reference"
        reference_type_id = "product"
      }
    }
  }
}

resource "commercetools_product_type" "mobile_broadband_subscription" {
  name        = "Mobile Broadband Subscription"
  description = "Mobile Broadband Subscription"
  key         = "mobilebroadbandsubscription"

  attribute {
    name = "Routers"
    label = {
      da = "Routers"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "set"
      element_type {
        name              = "reference"
        reference_type_id = "product"
      }
    }
  }

  attribute {
    name = "Fees"
    label = {
      da = "Fees"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "set"
      element_type {
        name              = "reference"
        reference_type_id = "product"
      }
    }
  }
}

resource "commercetools_product_type" "mobile_broadband_hardware" {
  name        = "Mobile Broadband Hardware"
  description = "Mobile Broadband Hardware"
  key         = "mobilebroadbandhardware"

  attribute {
    name = "Brand"
    label = {
      da = "Brand"
    }
    required   = true
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "InternalPrice"
    label = {
      da = "Internal price"
    }
    required   = false
    constraint = "None"
    searchable = false
    type {
      name = "money"
    }
  }
}

resource "commercetools_product_type" "fee" {
  name        = "Fee"
  description = "A Fee can be added to the Cart as an extra cost"
  key         = "fee"
}

resource "commercetools_product_type" "service_option" {
  name        = "Service Option"
  description = "Service Option"
  key         = "serviceoption"
}