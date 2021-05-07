resource "commercetools_type" "lineitem_group" {
    key = "lineitemgroup"
    name = {
        da = "Lineitem group"
        en = "Lineitem group"
    }
    description = {
        da = "Group lineitems in a Cart or Order"
        en = "Group lineitems in a Cart or Order"
    }

    resource_type_ids = ["line-item","custom-line-item"]

    field {
        name = "groupid"
        label = {
            da = "Group Id"
            en = "Group Id"
        }
        type {
            name = "Number"
        }
    }
}