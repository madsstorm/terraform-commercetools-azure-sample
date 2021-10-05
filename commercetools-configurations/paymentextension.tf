resource "commercetools_type" "payment_extension" {
  key = "payment"
  name = {
    da = "Payment extension"
  }

  resource_type_ids = ["payment"]

  field {
    name = "Description"
    label = {
      da = "Payment Description"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "PaymentTransactionId"
    label = {
      da = "Payment Transaction Id"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "MaskedCardNumber"
    label = {
      da = "Masked Card Number"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "ExpiryDate"
    label = {
      da = "Card Expiry Date"
    }
    type {
      name = "String"
    }
  }

  field {
    name = "MerchantId"
    label = {
      da = "Merchant Id"
    }
    type {
      name = "String"
    }
  }
}