resource "commercetools_product_type" "mobile-phone-product-type" {
    name = "Mobile Phone"
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
}

resource "commercetools_product_type" "tablet-product-type" {
        name = "Tablet"
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
}