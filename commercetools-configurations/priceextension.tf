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
}
