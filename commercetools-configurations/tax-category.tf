resource "commercetools_tax_category" "standard" {
  name = "standard"
  key  = "standard"
}

resource "commercetools_tax_category_rate" "standard_tax_category_da" {
  tax_category_id   = commercetools_tax_category.standard.id
  name              = "25% inkl."
  amount            = 0.25
  included_in_price = true
  country           = "DK"
}