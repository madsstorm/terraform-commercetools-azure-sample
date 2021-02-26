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

module "product-types" {
  source = "./modules/product-types"
}