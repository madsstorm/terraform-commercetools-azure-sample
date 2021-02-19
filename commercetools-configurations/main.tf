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
  languages  = ["en"]
  countries  = ["DK"]
}

resource "commercetools_tax_category" "standard" {
  name = "Standard tax category"
  key  = "standard-tax-category"
}

resource "commercetools_tax_category_rate" "standard_tax_category_da" {
  tax_category_id   = commercetools_tax_category.standard.id
  name              = "25% Moms"
  amount            = 0.25
  included_in_price = true
  country           = "DK"
}

module "product-types" {
  source = "./modules/product-types"
}