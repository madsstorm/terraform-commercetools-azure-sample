##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    commercetools = {
      source  = "labd/commercetools"
      version = "0.26.1"
    }
  }
}

##################################################################################
# RESOURCES
##################################################################################
resource "commercetools_product_type" "handset-product-type" {
  name        = "Handset"
  description = "Handset"

  attribute {
    name = "storage"
    label = {
      en = "Storage"
    }
    type {
      name = "text"
    }
  }

  attribute {
    name = "colour"
    label = {
      en = "Colour"
    }
    type {
      name = "text"
    }
  }
}