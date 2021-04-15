resource "commercetools_product_type" "smartphone" {
  name        = "Smartphone"
  description = "Smartphone"
  key         = "smartphone"

  attribute {
      name = "Brand"
      label = {
          da = "Brand"
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
          da = "Farve beskrivelse"
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
    }
    required = false
    constraint = "None"
    searchable = true
    type {
      name = "enum"
      values = {
        "Black" = "Black"
        "White" = "White"
        "Grey" = "Grey"
        "Blue" = "Blue"
        "Green" = "Green"
        "Red" = "Red"
        "Yellow" = "Yellow"
        "Purple" = "Purple"
        "Violet" = "Violet"
        "Pink" = "Pink"
        "Gold" = "Gold"
        "Silver" = "Silver"
        "Bronze" = "Bronze"
        "Transparent" = "Transparent"
        "Multicolored" = "Multicolored"
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
    }
    required = false
    constraint = "None"
    searchable = true
    type {
      name = "enum"
      values = {
        "Black" = "Black"
        "White" = "White"
        "Grey" = "Grey"
        "Blue" = "Blue"
        "Green" = "Green"
        "Red" = "Red"
        "Yellow" = "Yellow"
        "Purple" = "Purple"
        "Violet" = "Violet"
        "Pink" = "Pink"
        "Gold" = "Gold"
        "Silver" = "Silver"
        "Bronze" = "Bronze"
        "Transparent" = "Transparent"
        "Multicolored" = "Multicolored"
      }
    }
  }
}
