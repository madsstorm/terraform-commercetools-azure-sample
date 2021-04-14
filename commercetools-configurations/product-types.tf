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
    name = "ShortDescription"
    label = {
      da = "Kort beskrivelse"
      en = "Short description"
    }
    required = false
    constraint = "None"
    searchable = true
    input_hint = "MultiLine"
    type {
      name = "ltext"
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
}
