resource "commercetools_state" "order_open" {
  key  = "order-open"
  type = "OrderState"
  name = {
    da = "Order open"
  }
  description = {
    da = "The order is open."
  }
}

resource "commercetools_state" "order_oms_accepted" {
  key  = "order-oms-accepted"
  type = "OrderState"
  name = {
    da = "Order accepted by OMS"
  }
  description = {
    da = "The order was accepted by Order Management System."
  }
}

resource "commercetools_state" "order_oms_rejected" {
  key  = "order-oms-rejected"
  type = "OrderState"
  name = {
    da = "Order rejected by OMS"
  }
  description = {
    da = "The order was rejected by Order Management System."
  }
}