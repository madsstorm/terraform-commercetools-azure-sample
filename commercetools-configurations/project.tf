resource "commercetools_project_settings" "project" {
  name       = var.projectname
  currencies = ["DKK"]
  languages  = ["da"]
  countries  = ["DK"]
}
