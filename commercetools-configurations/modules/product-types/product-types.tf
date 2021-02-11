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
resource "commercetools_product_type" "mobile-phone-product-type" {
  name        = "Mobile Phone"
  description = "Mobile Phone"

  attribute {
    name = "camera"
    label = {
      da = "Kamera"
    }
    type {
      name = "text"
    }
  }

  attribute {
    name = "screen"
    label = {
      da = "Skærm"
    }
    type {
      name = "text"
    }
  }

  attribute {
    name = "storage"
    label = {
      da = "Lager"
    }
    type {
      name = "text"
    }
  }

  attribute {
    name = "colour"
    label = {
      da = "Farve"
    }
    type {
      name = "text"
    }
  }

#   attribute {
#       name = "relations"
#       label = {
#           da = "Relationer"
#       }
#       type {
#           name = "nested"
#           type_reference = commercetools_product_type.nested_relations_type.id
#       }
#   }
}

resource "commercetools_product_type" "tablet-product-type" {
  name        = "Tablet"
  description = "Tablet"

  attribute {
    name = "screen"
    label = {
      da = "Skærm"
    }
    type {
      name = "text"
    }
  }

  attribute {
    name = "sim-card"
    label = {
      da = "SIM kort"
    }
    type {
      name = "boolean"
    }
  }

  attribute {
    name = "colour"
    label = {
      da = "Farve"
    }
    type {
      name = "text"
    }
  }
}