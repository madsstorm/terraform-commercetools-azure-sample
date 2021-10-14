resource "commercetools_product_type" "device" {
  name        = "Device"
  description = "Device"
  key         = "device"


  # attribute {
  #   name = "Brand"
  #   label = {
  #     da = "Mærke"
  #   }
  #   required   = true
  #   constraint = "SameForAll"
  #   searchable = true
  #   type {
  #     name = "lenum"
  #     localized_value {
  #       key = "apple"
  #       label = {
  #         da = "Apple"
  #       }
  #     }
  #     localized_value {
  #       key = "samsung"
  #       label = {
  #         da = "Samsung"
  #       }
  #     }
  #     localized_value {
  #       key = "huawei"
  #       label = {
  #         da = "Huawei"
  #       }
  #     }
  #     localized_value {
  #       key = "oneplus"
  #       label = {
  #         da = "OnePlus"
  #       }
  #     }
  #     localized_value {
  #       key = "motorola"
  #       label = {
  #         da = "Motorola"
  #       }
  #     }
  #     localized_value {
  #       key = "sony"
  #       label = {
  #         da = "Sony"
  #       }
  #     }                              
  #   }
  # }

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

  # attribute {
  #   name = "Storage"
  #   label = {
  #     da = "Kapacitet"
  #   }
  #   required   = true
  #   constraint = "None"
  #   searchable = true
  #   type {
  #     name = "lenum"
  #     localized_value {
  #       key = "0000032"
  #       label = {
  #         da = "32 GB"
  #       }
  #     }
  #     localized_value {
  #       key = "0000064"
  #       label = {
  #         da = "64 GB"
  #       }
  #     }
  #     localized_value {
  #       key = "0000128"
  #       label = {
  #         da = "128 GB"
  #       }
  #     }
  #     localized_value {
  #       key = "0000256"
  #       label = {
  #         da = "256 GB"
  #       }
  #     }
  #     localized_value {
  #       key = "0000512"
  #       label = {
  #         da = "512 GB"
  #       }
  #     }
  #     localized_value {
  #       key = "0001024"
  #       label = {
  #         da = "1 TB"
  #       }
  #     }
  #     localized_value {
  #       key = "0002048"
  #       label = {
  #         da = "2 TB"
  #       }
  #     }
  #   }
  # }

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
        key = "grey"
        label = {
          da = "Grå"
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
      localized_value {
        key = "transparent"
        label = {
          da = "Transparent"
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

  # attribute {
  #   name = "Brand"
  #   label = {
  #     da = "Mærke"
  #   }
  #   required   = true
  #   constraint = "SameForAll"
  #   searchable = true
  #   type {
  #     name = "lenum"
  #     localized_value {
  #       key = "apple"
  #       label = {
  #         da = "Apple"
  #       }
  #     }
  #     localized_value {
  #       key = "samsung"
  #       label = {
  #         da = "Samsung"
  #       }
  #     }
  #     localized_value {
  #       key = "sony"
  #       label = {
  #         da = "Sony"
  #       }
  #     }
  #     localized_value {
  #       key = "puro"
  #       label = {
  #         da = "Puro"
  #       }
  #     }
  #     localized_value {
  #       key = "google"
  #       label = {
  #         da = "Google"
  #       }
  #     }
  #     localized_value {
  #       key = "panzer"
  #       label = {
  #         da = "Panzer"
  #       }
  #     }
  #     localized_value {
  #       key = "sonos"
  #       label = {
  #         da = "Sonos"
  #       }
  #     }
  #   }
  # }

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
        key = "grey"
        label = {
          da = "Grå"
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
      localized_value {
        key = "transparent"
        label = {
          da = "Transparent"
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
  description = "Mobile Subscription."
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
    name = "LocalizedBrand"
    label = {
      da = "Localized mærke"
    }
    required = true
    constraint = "SameForAll"
    searchable = true
    type {
      name = "lenum"
      localized_value {
        key = "apple"
        label = {
          da = "Apple"
        }
      }
      localized_value {
        key = "motorola"
        label = {
          da = "Motorola"
        }
      }
      localized_value {
        key = "nokia"
        label = {
          da = "Nokia"
        }
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