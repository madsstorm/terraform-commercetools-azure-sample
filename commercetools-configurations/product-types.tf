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
        apple = "Apple"
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
    name = "ScreenResolution"
    label = {
      da = "Skærmopløsning"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "DisplayType"
    label = {
      da = "Skærmtype"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "CameraResolution"
    label = {
      da = "Kameraopløsning"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "FrontCameraResolution"
    label = {
      da = "Frontkameraopløsning"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "MaxExternalMemory"
    label = {
      da = "Max ekstern hukommelse"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "CableConnectivity"
    label = {
      da = "Tilslutning oplader"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "HeadsetConnection"
    label = {
      da = "Tilslutning hovedtelefoner"
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
    name = "E-SIM"
    label = {
      da = "E-SIM"
    }
    required   = true
    constraint = "SameForAll"
    searchable = true
    type {
      name = "boolean"
    }
  }

  attribute {
    name = "DualSIM"
    label = {
      da = "Dual SIM"
    }
    required   = true
    constraint = "SameForAll"
    searchable = true
    type {
      name = "boolean"
    }
  }

  attribute {
    name = "BatteryCapacity"
    label = {
      da = "Batterikapacitet"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "Processor"
    label = {
      da = "Processor"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "RAM"
    label = {
      da = "RAM"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
    }
  }

  attribute {
    name = "OperatingSystem"
    label = {
      da = "Operativsystem"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "text"
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
      name = "enum"
      values = {
        "0000032" = "32 GB"
        "0000064" = "64 GB"
        "0000128" = "128 GB"
        "0000256" = "256 GB"
        "0000512" = "512 GB"
        "0001024" = "1 TB"
        "0002048" = "2 TB"
      }
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
        key = "silver"
        label = {
          da = "Sølv"
        }
      }
    }
  }

  attribute {
    name = "Height"
    label = {
      da = "Højde"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "number"
    }
  }

  attribute {
    name = "Width"
    label = {
      da = "Bredde"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "number"
    }
  }

  attribute {
    name = "Depth"
    label = {
      da = "Dybde"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "number"
    }
  }

  attribute {
    name = "Weight"
    label = {
      da = "Vægt"
    }
    required   = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "number"
    }
  }

  attribute {
    name = "InternalPrice"
    label = {
      da = "Intern pris"
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

  attribute {
    name = "CopyPricesFromSku"
    label = {
      da = "Kopier priser fra SKU"
    }
    required   = false
    constraint = "None"
    searchable = false
    type {
      name = "text"
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
      da = "Mærke"
    }
    required   = true
    constraint = "SameForAll"
    searchable = true
    type {
      name = "enum"
      values = {
        apple = "Apple"
      }
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
      da = "Intern pris"
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
      da = "Bindingsperiode"
    }
    required   = false
    constraint = "SameForAll"
    searchable = false
    type {
      name = "number"
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
      da = "Routere"
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
      da = "Mærke"
    }
    required   = true
    constraint = "SameForAll"
    searchable = true
    type {
      name = "enum"
      values = {
        apple = "Apple"
      }
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
    name = "InternalPrice"
    label = {
      da = "Intern pris"
    }
    required   = false
    constraint = "None"
    searchable = false
    type {
      name = "money"
    }
  }
}

resource "commercetools_product_type" "service_option" {
  name        = "Service Option"
  description = "Service Option"
  key         = "serviceoption"
}