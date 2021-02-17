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
resource "commercetools_project_settings" "project" {
  name       = "Trial"
  currencies = ["DKK"]
  languages  = ["da"]
  countries  = ["DK"]
}

resource "commercetools_tax_category" "standard" {
  name = "Standard tax category"
  key  = "standard-tax-category"
}

resource "commercetools_tax_category_rate" "standard-tax-category-DA" {
  tax_category_id   = "${commercetools_tax_category.standard.id}"
  name              = "25% Moms"
  amount            = 0.25
  included_in_price = true
  country           = "DA"
}

module "product-types" {
  source = "./modules/product-types"
}