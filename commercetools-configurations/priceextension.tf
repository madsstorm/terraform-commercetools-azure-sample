resource "commercetools_type" "price_extension" {
  key = "priceextension"
  name = {
    da = "Price extension"
  }

  resource_type_ids = ["product-price"]

  field {
    name     = "Recurring"
    required = true
    label = {
      da = "Recurring payment"
    }
    type {
      name = "Boolean"
    }
  }

 field {
   name     = "Campaign"
   required = false
   label = {
     da = "Kampagne"
   }
   type {
     name = "String"
   }
 }

 field {
   name     = "SomeNumber"
   required = false
   label = {
     da = "SomeNumber"
   }
   type {
     name = "Number"
   }
 }

 field {
   name     = "SomeEnum"
   required = false
   label = {
     da = "SomeEnum"
   }
   type {
     name = "Enum"
     values = {
       monday  = "Monday"
       tuesday = "Tuesday"
     }
   }
 }

 field {
   name     = "SomeLocalizedEnum"
   required = false
   label = {
     da = "SomeLocalizedEnum"
   }
   type {
      name = "LocalizedEnum"
      localized_value {
        key = "phone"
        label = {
          da = "Telefon"
        }
      }
      localized_value {
        key = "skype"
        label = {
          da = "Skype"
        }
      }
   }
 }

 field {
   name     = "SomeStringSet"
   required = false
   label = {
     da = "SomeStringSet"
   }
   type {
      name = "Set"
      element_type {
        name = "String"
      }
    }
 }

 field {
    name  = "SomeProductRefSet"
    label = {
      da = "SomeProductRefSet"
    }
    type {
      name = "Set"
      element_type {
        name              = "Reference"
        reference_type_id = "product"
      }
    }
  }
}
