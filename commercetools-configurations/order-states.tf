resource "commercetools_state" "order_open" {
  key = "order-open"
  type = "OrderState"
  name = {
    da = "Order open"
  }
  description = {
    da = "The order is open."
  }
}

resource "commercetools_state" "order_accepted_oms" {
  key = "order-accepted-oms"
  type = "OrderState"
  name = {
    da = "Order accepted by OMS"
  }
  description = {
    da = "The order was accepted by Order Management System."
  }
}

resource "commercetools_state" "order_rejected_oms" {
  key = "order-rejected-oms"
  type = "OrderState"
  name = {
    da = "Order rejected by OMS"
  }
  description = {
    da = "The order was rejected by Order Management System."
  }
}