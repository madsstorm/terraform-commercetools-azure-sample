terraform {
  required_providers {
    commercetools = {
      source  = "labd/commercetools"
      version = "0.26.1"
    }
  }
}

resource "commercetools_project_settings" "project" {
  name       = "Trial"
  currencies = ["DKK"]
  languages  = ["en", "da"]
  countries  = ["DK"]
}
