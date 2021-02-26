resource "commercetools_product_type" "mobile_broadband_product_type" {
  name        = "Mobile broadband"
  description = "Mobile broadband"
  key         = "mobile-broadband"
}

resource "commercetools_product_type" "modem_product_type" {
  name        = "Modem"
  description = "Modem"
  key         = "modem"

  attributes {
    name = "short-description"
    label = {
      en = "Short description"
      da = "Kort beskrivelse"
    }
    required = false
    constraint = "None"
    searchable = true
    input_hint = "MultiLine"
    type {
      name = "ltext"
    }
  }

    attributes {
    name = "general-description"
    label = {
      en = "General description"
      da = "General beskrivelse"
    }
    required = false
    constraint = "None"
    searchable = true
    input_hint = "MultiLine"
    type {
      name = "ltext"
    }
  }
}
