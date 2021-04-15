resource "commercetools_type" "price_with_minimum_price" {
    key = "price-withMinimumPrice"
    name = {
        da = "Minimumspris"
    }
    description = {
        da = "Minimumspris"
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