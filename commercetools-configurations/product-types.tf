resource "commercetools_product_type" "device" {
  name        = "Device"
  description = "Device"
  key         = "device"

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
    name = "ScreenSize"
    label = {
      da = "Screen size"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
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
      da = "Storage"
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

  attribute {
    name = "SubscriptionCategory"
    label = {
      da = "Subscription category"
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
      da = "Default Subscription"
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
      da = "Accessory category"
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
      da = "Accessories"
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
      da = "Value Added Services"
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