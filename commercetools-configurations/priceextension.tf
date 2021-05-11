resource "commercetools_type" "price_extension" {
    key = "priceextension"
    name = {
        da = "Price extension"
        en = "Price extension"
    }

    resource_type_ids = ["product-price"]

    field {
        name = "PriceType"
        label = {
            da = "Price type"
            en = "Price type"
        }
        type {
            name = "enum"
            values = {
                "OneTime" = "OneTime"
                "Recurring" = "Recurring"
            }
        }
    }
}