resource "commercetools_product_type" "handset" {
  name        = "Handset"
  description = "Handset"
  key         = "handset"

  attribute {
      name = "Brand"
      label = {
          da = "Brand"
          en = "Brand"
      }
      required = true
      constraint = "SameForAll"
      searchable = true
      type {
          name = "enum"         
          values = {
              samsung = "Samsung"
              huawei = "Huawei"
              sony = "Sony"
              apple = "Apple"
              oneplus = "OnePlus"
              motorola = "Motorola"
          }
      }
  }

  attribute {
      name = "Storage"
      label = {
          da = "Storage"
          en = "Storage"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "enum"
          values = {
              "16 GB" = "16 GB"
              "32 GB" = "32 GB"
              "64 GB" = "64 GB"
              "128 GB" = "128 GB"
              "256 GB" = "256 GB"
              "512 GB" = "512 GB"
              "1 TB" = "1 TB"
              "2 TB" = "2 TB"
              "4 TB" = "4 TB"
              "8 TB" = "8 TB"
          }
      }
  }

  attribute {
      name = "ColorDescription"
      label = {
          da = "Farvebeskrivelse"
          en = "Color description"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "ltext"
      }
  }

  attribute {
    name = "FilterColor"
    label = {
      da = "Filterfarve"
      en = "Filter color"
    }
    required = false
    constraint = "None"
    searchable = true
    type {
      name = "lenum"
      localized_value {
        key = "black"
        label = {
          da = "Sort"
          en = "Black"
        }
      }
      localized_value {
        key = "white"
        label = {
          da = "Hvid"
          en = "White"
        }
      }
      localized_value {
        key = "grey"
        label = {
          da = "Grå"
          en = "Grey"
        }
      }
      localized_value {
        key = "blue"
        label = {
          da = "Blå"
          en = "Blue"
        }
      }
      localized_value {
        key = "green"
        label = {
          da = "Grøn"
          en = "Green"
        }
      }
      localized_value {
        key = "red"
        label = {
          da = "Rød"
          en = "Red"
        }
      }
      localized_value {
        key = "yellow"
        label = {
          da = "Gul"
          en = "Yellow"
        }
      }
      localized_value {
        key = "purple"
        label = {
          da = "Lilla"
          en = "Purple"
        }
      }
      localized_value {
        key = "violet"
        label = {
          da = "Violet"
          en = "Violet"
        }
      }
      localized_value {
        key = "pink"
        label = {
          da = "Pink"
          en = "Pink"
        }
      }
      localized_value {
        key = "gold"
        label = {
          da = "Guld"
          en = "Gold"
        }
      }
      localized_value {
        key = "silver"
        label = {
          da = "Sølv"
          en = "Silver"
        }
      }
      localized_value {
        key = "bronze"
        label = {
          da = "Bronze"
          en = "Bronze"
        }
      }
      localized_value {
        key = "transparent"
        label = {
          da = "Transparent"
          en = "Transparent"
        }
      }
      localized_value {
        key = "multicolored"
        label = {
          da = "Flerfarvet"
          en = "Multicolored"
        }
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
          en = "Brand"
      }
      required = true
      constraint = "SameForAll"
      searchable = true
      type {
          name = "enum"
          values = {
              apple = "Apple"
              samsung = "Samsung"
              google = "Google"
              puro = "Puro"
              panzer = "Panzer"
              kingston = "Kingston"
              lenovo = "Lenovo"
              sonos = "Sonos"
          }
      }
  }

  attribute {
      name = "ColorDescription"
      label = {
          da = "Farve beskrivelse"
          en = "Color description"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "ltext"
      }
  }
  
  attribute {
    name = "FilterColor"
    label = {
      da = "Filterfarve"
      en = "Filter color"
    }
    required = false
    constraint = "None"
    searchable = true
    type {
      name = "lenum"
      localized_value {
        key = "black"
        label = {
          da = "Sort"
          en = "Black"
        }
      }
      localized_value {
        key = "white"
        label = {
          da = "Hvid"
          en = "White"
        }
      }
      localized_value {
        key = "grey"
        label = {
          da = "Grå"
          en = "Grey"
        }
      }
      localized_value {
        key = "blue"
        label = {
          da = "Blå"
          en = "Blue"
        }
      }
      localized_value {
        key = "green"
        label = {
          da = "Grøn"
          en = "Green"
        }
      }
      localized_value {
        key = "red"
        label = {
          da = "Rød"
          en = "Red"
        }
      }
      localized_value {
        key = "yellow"
        label = {
          da = "Gul"
          en = "Yellow"
        }
      }
      localized_value {
        key = "purple"
        label = {
          da = "Lilla"
          en = "Purple"
        }
      }
      localized_value {
        key = "violet"
        label = {
          da = "Violet"
          en = "Violet"
        }
      }
      localized_value {
        key = "pink"
        label = {
          da = "Pink"
          en = "Pink"
        }
      }
      localized_value {
        key = "gold"
        label = {
          da = "Guld"
          en = "Gold"
        }
      }
      localized_value {
        key = "silver"
        label = {
          da = "Sølv"
          en = "Silver"
        }
      }
      localized_value {
        key = "bronze"
        label = {
          da = "Bronze"
          en = "Bronze"
        }
      }
      localized_value {
        key = "transparent"
        label = {
          da = "Transparent"
          en = "Transparent"
        }
      }
      localized_value {
        key = "multicolored"
        label = {
          da = "Flerfarvet"
          en = "Multicolored"
        }
      }
    }
  }
}

resource "commercetools_product_type" "subscription" {
  name        = "Subscription"
  description = "Subscription"
  key         = "subscription"
}

resource "commercetools_product_type" "handset_bundle" {
  name        = "Handset Bundle"
  description = "Handset Bundle"
  key         = "handsetbundle"

  attribute {
      name = "Handset"
      label = {
          da = "Handset"
          en = "Handset"
      }
      required = true
      constraint = "SameForAll"
      searchable = true
      type {
          name = "reference"
          reference_type_id = "product"
      }
  }

  attribute {
    name = "HandsetSKU"
    label = {
          da = "Handset SKU"
          en = "Handset SKU"
    }
    required = true
    constraint = "None"
    searchable = false
    type {
      name = "text"
    }
  }

  attribute {
    name = "HandsetVariantId"
    label = {
          da = "Handset Variant Id"
          en = "Handset Variant Id"
    }
    required = true
    constraint = "None"
    searchable = false
    type {
      name = "number"
    }
  }

  attribute {
    name = "SubscriptionCategory"
    label = {
      da = "Subscription Category"
      en = "Subscription Category"
    }
    required = false
    constraint = "SameForAll"
    searchable = false
    type {
      name = "reference"
      reference_type_id = "category"
      }
  }
}
