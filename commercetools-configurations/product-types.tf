resource "commercetools_product_type" "handset_product_type" {
  name        = "Handset"
  description = "Handset"

  attribute {
    name = "storage"
    label = {
      da = "Lager"
      en = "Storage"
    }
    type {
      name = "enum"
      values = {
        8    = "8 GB"
        16   = "16 GB"
        32   = "32 GB"
        64   = "64 GB"
        128  = "128 GB"
        256  = "256 GB"
        512  = "512 GB"
        1024 = "1 TB"
        2048 = "2 TB"
        4096 = "4 TB"
        8192 = "8 TB"
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
