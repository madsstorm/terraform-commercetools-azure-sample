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
              huawei = "Huawei"
              sony = "Sony"
              oneplus = "OnePlus"
              motorola = "Motorola"
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
      name = "ColourDescription"
      label = {
          da = "Farve beskrivelse"
          en = "Colour description"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "ltext"
      }
  }
  
  attribute {
    name = "FilterColour"
    label = {
      da = "Filterfarve"
      en = "Filter colour"
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
    }
  }
}
