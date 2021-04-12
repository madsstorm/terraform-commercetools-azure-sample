resource "commercetools_product_type" "smartphone" {
  name        = "Smartphone"
  description = "Smartphone"
  key         = "smartphone"

  attribute {
      name = "Brand"
      label = {
          da = "Brand"
          en = "Brand"
      }
      required = true
      constraint = "SameForAll"
      searchable = true
      type {
          name = "enum"
          values = {
              samsung = "Samsung"
              huawei = "Huawei"
              sony = "Sony"
              apple = "Apple"
              oneplus = "OnePlus"
              motorola = "Motorola"
          }
      }
  }

  attribute {
      name = "Storage"
      label = {
          da = "Storage"
          en = "Storage"
      }
      required = false
      constraint = "None"
      searchable = false
      type {
          name = "enum"
          values = {
              32 = "32 GB"
              64 = "64 GB"
              128 = "128 GB"
              256 = "256 GB"
              512 = "512 GB"
              1024 = "1 TB"
              2048 = "2 TB"
              4096 = "4 TB"
              8192 = "8 TB"              
          }
      }
  }

  attribute {
      name = "ColourDescription"
      label = {
          da = "Farve beskrivelse"
          en = "Colour description"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "ltext"
      }
  }
}

resource "commercetools_product_type" "tablet" {
  name        = "Tablet"
  description = "Tablet"
  key         = "tablet"

  attribute {
      name = "Brand"
      label = {
          da = "Brand"
          en = "Brand"
      }
      required = true
      constraint = "SameForAll"
      searchable = true
      type {
          name = "enum"
          values = {
              samsung = "Samsung"
              apple = "Apple"
          }
      }
  }

  attribute {
      name = "Storage"
      label = {
          da = "Storage"
          en = "Storage"
      }
      required = false
      constraint = "None"
      searchable = false
      type {
          name = "enum"
          values = {
              32 = "32 GB"
              64 = "64 GB"
              128 = "128 GB"
              256 = "256 GB"
              512 = "512 GB"
              1024 = "1 TB"
              2048 = "2 TB"
              4096 = "4 TB"
              8192 = "8 TB"              
          }
      }
  }

  attribute {
      name = "ColourDescription"
      label = {
          da = "Farve beskrivelse"
          en = "Colour description"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "ltext"
      }
  }
}
