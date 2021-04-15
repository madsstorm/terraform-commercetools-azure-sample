resource "commercetools_type" "price_with_minimum_price" {
    key = "price-withMinimumPrice"
    name = {
        en = "Custom minimum price"
        da = "Custom minimumspris"
    }
    description = {
        en = "Custom minimum price"
        da = "Custom minimumspris"
    }

    resource_type_ids = ["product-price"]

    field {
        name = "minimum_price"
        label = {
            en = "Minimum price"
            da = "Minimumspris"   
        }
        required = false
        type {
            name = "Money"
        }
    }
}