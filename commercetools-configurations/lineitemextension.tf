resource "commercetools_type" "lineitem_extension" {
    key = "lineitemextension"
    name = {
        da = "Lineitem extension"
        en = "Lineitem extension"
    }

    resource_type_ids = ["line-item","custom-line-item"]

    field {
        name = "GroupId"
        label = {
            da = "Group Id"
            en = "Group Id"
        }
        type {
            name = "text"
        }
    }
}