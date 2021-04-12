terraform {
  required_providers {
    commercetools = {
      source  = "labd/commercetools"
      version = "0.28.0"
    }
  }
}

resource "commercetools_project_settings" "project" {
  name       = var.projectname
  currencies = ["DKK"]
  languages  = ["en", "da"]
  countries  = ["DK"]
}
