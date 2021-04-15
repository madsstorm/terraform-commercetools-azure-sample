resource "commercetools_type" "price_with_minimum_price" {
    key = "price-withMinimumPrice"
    name = {
        da = "Custom minimumspris"
    }
    description = {
        da = "Custom minimumspris"
    }

    resource_type_ids = ["product-price"]

    field {
        name = "minimumPrice"
        label = {
            da = "Minimumspris"   
        }
        required = false
        type {
            name = "Money"
        }
    }
}