resource "commercetools_type" "channel_extension" {
  key = "channelextension"
  name = {
    da = "Channel extension"
  }

  resource_type_ids = ["channel"]

  field {
    name = "Products"
    label = {
      da = "Products"
    }
    type {
      name = "Set"
      element_type {
        name              = "Reference"
        reference_type_id = "product"
      }
    }
  }

  field {
    name = "SKUs"
    label = {
      da = "SKUs"
    }
    type {
      name = "Set"
      element_type {
        name = "String"
      }
    }
  }

  field {
    name = "Categories"
    label = {
      da = "Categories"
    }
    type {
      name = "Set"
      element_type {
        name              = "Reference"
        reference_type_id = "category"
      }
    }
  }
}