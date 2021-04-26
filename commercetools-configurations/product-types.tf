resource "commercetools_product_type" "device" {
  name        = "Device"
  description = "Device"
  key         = "device"

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
          name = "ltext"
      }
  }

  attribute {
      name = "StorageGB"
      label = {
          da = "Storage GB"
          en = "Storage GB"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "number"
      }
  }

  attribute {
      name = "ScreenSizeInches"
      label = {
          da = "Skærmstørrelse tommer"
          en = "Screen size inches"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "number"
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
    name = "CostPrice"
    label = {
      da = "Kostpris"
      en = "Cost price"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "money"
    }
  }

  attribute {
    name = "5G"
    label = {
      da = "5G"
      en = "5G"
    }
    required = false
    constraint = "None"
    searchable = true
    type {
      name = "boolean"
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
          name = "ltext"
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
    name = "CostPrice"
    label = {
      da = "Kostpris"
      en = "Cost price"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "money"
    }
  }
}

resource "commercetools_product_type" "subscription" {
  name        = "Subscription"
  description = "Subscription"
  key         = "subscription"
}
