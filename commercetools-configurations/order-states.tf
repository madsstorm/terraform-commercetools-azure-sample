resource "commercetools_state" "order_open" {
    key = "order-open"
    type = "OrderState"
    name = {
        da = "Åben"
        en = "Open"        
    }
    description = {
        da = "Ordren er åben"
        en = "Order is open"
    }
    initial = true
    transitions = [commercetools_state.order_cancelled.key]
}

resource "commercetools_state" "order_cancelled" {
    key = "order-cancelled"
    type = "OrderState"
    name = {
        da = "Annulleret"
        en = "Cancelled"
    }
    description = {
        da = "Ordren er annulleret"
        en = "Order is cancelled"
    }
}