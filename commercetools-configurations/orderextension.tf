resource "commercetools_type" "order_extension" {
    key = "orderextension"
    name = {
        da = "Order extension"
        en = "Order extension"
    }

    resource_type_ids = ["order"]

    field {
        name = "Instalments"
        label = {
            da = "Instalments"
            en = "Instalments"
        }
        type {
            name = "Number"
        }
    }
}