##################################################################################
# RESOURCES
##################################################################################
resource "commercetools_product_type" "product_relation" {
  name        = "Product relation"
  description = "Product relation"

  attribute {
    name = "product"
    label = {
      da = "Produkt"
    }
    type {
      name              = "reference"
      reference_type_id = "product"
    }
  }

  attribute {
    name = "required"
    label = {
      da = "Obligatorisk"
    }
    type {
      name = "boolean"
    }
  }
}

resource "commercetools_product_type" "product_type_relation" {
  name        = "Product Type relation"
  description = "Product Type relation"

  attribute {
    name = "product_type"
    label = {
      da = "Produkt Type"
    }
    type {
      name              = "reference"
      reference_type_id = "product-type"
    }

  }

  attribute {
    name = "required"
    label = {
      da = "Obligatorisk"
    }
    type {
      name = "boolean"
    }
  }
}

resource "commercetools_product_type" "category_relation" {
  name        = "Category relation"
  description = "Category relation"

  attribute {
    name = "category"
    label = {
      da = "Kategori"
    }
    type {
      name              = "reference"
      reference_type_id = "category"
    }

  }

  attribute {
    name = "required"
    label = {
      da = "Obligatorisk"
    }
    type {
      name = "boolean"
    }
  }
}