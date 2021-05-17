resource "commercetools_type" "price_extension" {
    key = "priceextension"
    name = {
        da = "Price extension"
        en = "Price extension"
    }

    resource_type_ids = ["product-price"]

    field {
        name = "IsRecurring"
        required = true
        label = {
            da = "Abonnementsbetaling"
            en = "Recurring payment"
        }
        type {
            name = "Boolean"
        }
    }
}