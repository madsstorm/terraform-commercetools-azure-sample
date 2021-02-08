##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
      commercetools = {
      source = "labd/commercetools"
      version = "0.26.1"
    }
  }
}

##################################################################################
# PROVIDERS
##################################################################################
provider "commercetools" {
}

##################################################################################
# RESOURCES
##################################################################################
resource "commercetools_project_settings" "project" {
    name = "Trial"
    currencies = ["DKK"]
    languages = ["da"]
    countries = ["DK"]
}

module "product-types" {
    source = "./modules/product-types"
}