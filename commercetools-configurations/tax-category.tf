resource "commercetools_tax_category" "moms" {
  name = "Moms"
  key  = "Moms"
}

resource "commercetools_tax_category_rate" "moms_dk" {
  tax_category_id   = commercetools_tax_category.moms.id
  name              = "Moms"
  amount            = 0.25
  included_in_price = true
  country           = "DK"
}