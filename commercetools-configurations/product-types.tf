locals {
  colors = {
    "black" = { "da" = "Sort", "en" = "Black" }
    "white" = { "da" = "Hvid", "en" = "White" }
    "grey" = { "da" = "Grå", "en" = "Grey" }
    "blue" = { "da" = "Blå", "en" = "Blue" }
    "green" = { "da" = "Grøn", "en" = "Green" }
    "red" = { "da" = "Rød", "en" = "Red" }
    "yellow" = { "da" = "Gul", "en" = "Yellow" }
    "purple" = { "da" = "Lilla", "en" = "Purple" }
    "violet" = { "da" = "Violet", "en" = "Violet" }
    "pink" = { "da" = "Pink", "en" = "Pink" }
    "gold" = { "da" = "Guld", "en" = "Gold" }
    "silver" = { "da" = "Sølv", "en" = "Silver" }
    "bronze" = { "da" = "Bronze", "en" = "Bronze" }
    "multicolored" = { "da" = "Flerfarvet", "en" = "Multicolored" }
  }
}

resource "commercetools_product_type" "smartphone" {
  name        = "Smartphone"
  description = "Smartphone"
  key         = "smartphone"

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
              "16GB" = "16 GB"
              "32GB" = "32 GB"
              "64GB" = "64 GB"
              "128GB" = "128 GB"
              "256GB" = "256 GB"
              "512GB" = "512 GB"
              "1TB" = "1 TB"
              "2TB" = "2 TB"
              "4TB" = "4 TB"
              "8TB" = "8 TB"
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
      dynamic "localized_value" {
        for_each = local.colors
        content {
          key  = localized_value.key
          label = {
            da = localized_value.value.da
            en = localized_value.value.en
          }
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
      dynamic "localized_value" {
        for_each = local.colors
        content {
          key  = localized_value.key
          label = {
            da = localized_value.value.da
            en = localized_value.value.en
          }
        }
      }
    }
  }
}
