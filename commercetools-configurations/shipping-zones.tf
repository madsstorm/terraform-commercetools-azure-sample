resource "commercetools_shipping_zone" "denmark" {
  name        = "Denmark"
  description = "Denmark"
  location {
    country = "DK"
  }
}
