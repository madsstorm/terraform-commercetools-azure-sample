resource "commercetools_type" "order_extension" {
  key = "orderextension"
  name = {
    da = "Order extension"
  }

  resource_type_ids = ["order"]

  field {
    name = "SalesChannelInfo"
    label = {
      da = "Sales Channel Info"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "OsmOrderId"
    label = {
      da = "OsmOrderId"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "OsmOrderStatus"
    label = {
      da = "OsmOrderStatus"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "CustomerCPRNumber"
    label = {
      da = "Customer CPR"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "CustomerCVRNumber"
    label = {
      da = "Customer CVR"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "OmsResponseCode"
    label = {
      da = "OMS response code"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "OmsResponseMessage"
    label = {
      da = "OMS response message"
    }
    type {
      name = "String"
    }
  }
}