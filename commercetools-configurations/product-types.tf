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
        key = "blue"
        label = {
          da = "Blå"
          en = "Blue"
        }
      }
      localized_value {
        key = "red"
        label = {
          da = "Rød"
          en = "Red"
        }
      }
    }
  }
}
