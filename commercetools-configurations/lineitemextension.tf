resource "commercetools_type" "lineitem_extension" {
  key = "lineitemextension"
  name = {
    da = "Lineitem extension"
  }

  resource_type_ids = ["line-item", "custom-line-item"]

  field {
    name = "GroupId"
    label = {
      da = "Group Id"
    }
    type {
      name = "Number"
    }
  }

  field {
    name = "AlternateContactNumber"
    label = {
      da = "Alternate Contact Number"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "IsNumberPorting"
    label = {
      da = "Is Number Porting"
    }
    type {
      name = "String"
    }
  }
}