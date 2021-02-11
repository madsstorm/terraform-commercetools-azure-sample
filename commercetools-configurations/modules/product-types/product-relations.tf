##################################################################################
# RESOURCES
##################################################################################
resource "commercetools_product_type" "nested_relations_type" {
  name        = "Nested relations"
  description = "Nested relations"

  attribute {
    name = "variant_related_products"
    label = {
      da = "Relaterede produkter"
    }
    required   = false
    constraint = "None"
    type {
      name = "set"
      element_type {
        name           = "nested"
        type_reference = commercetools_product_type.product_relation.id
      }
    }
  }

  attribute {
    name = "product_related_products"
    label = {
      da = "Relaterede produkter"
    }
    required   = false
    constraint = "SameForAll"
    type {
      name = "set"
      element_type {
        name           = "nested"
        type_reference = commercetools_product_type.product_relation.id
      }
    }
  }

  attribute {
    name = "variant_related_product_types"
    label = {
      da = "Relaterede produkt typer"
    }
    required   = false
    constraint = "None"
    type {
      name = "set"
      element_type {
        name           = "nested"
        type_reference = commercetools_product_type.product_type_relation.id
      }
    }
  }

  attribute {
    name = "product_related_product_types"
    label = {
      da = "Relaterede produkt typer"
    }
    required   = false
    constraint = "SameForAll"
    type {
      name = "set"
      element_type {
        name           = "nested"
        type_reference = commercetools_product_type.product_type_relation.id
      }
    }
  }

  attribute {
    name = "variant_related_categories"
    label = {
      da = "Relaterede kategorier"
    }
    required   = false
    constraint = "None"
    type {
      name = "set"
      element_type {
        name           = "nested"
        type_reference = commercetools_product_type.category_relation.id
      }
    }
  }

  attribute {
    name = "product_related_categories"
    label = {
      da = "Relaterede kategorier"
    }
    required   = false
    constraint = "SameForAll"
    type {
      name = "set"
      element_type {
        name           = "nested"
        type_reference = commercetools_product_type.category_relation.id
      }
    }
  }
}

resource "commercetools_product_type" "product_relation" {
  name        = "Product relation"
  description = "Product relation"

  attribute {
    name = "product"
    label = {
      da = "Produkt"
    }
    required = true
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
    required = true
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
    required = true
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
    required = true
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
    required = true
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
    required = true
    type {
      name = "boolean"
    }
  }
}