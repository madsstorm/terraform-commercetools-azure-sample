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
      name = "Enum"
      values = {
        16   = "16 GB"
        32   = "32 GB"
        64   = "64 GB"
        128  = "128 GB"
        256  = "256 GB"
        512  = "512 GB"
        1024 = "1 TB"
        2048 = "2 TB"
      }
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
