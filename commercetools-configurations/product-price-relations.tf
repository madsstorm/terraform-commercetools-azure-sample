resource "commercetools_product_type" "product_price_relations" {
  name        = "Product price relations"
  description = "Prices and relations for products"
  key         = "product-price-relations"

  attribute {
    name = "prices_reference"
    label = {
      da = "Priser"
      en = "Prices"
    }
    required   = false
    constraint = "SameForAll"
    searchable = false
    type {
      name              = "reference"
      reference_type_id = "key-value-document"
    }
  }

  attribute {
    name = "relations_reference"
    label = {
      da = "Relationer"
      en = "Relations"
    }
    required   = false
    constraint = "SameForAll"
    searchable = false
    type {
      name              = "reference"
      reference_type_id = "key-value-document"
    }
  }
}
