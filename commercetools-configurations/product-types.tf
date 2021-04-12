resource "commercetools_product_type" "smartphone" {
  name        = "Smartphone"
  description = "Smartphone"
  key         = "smartphone"

  attribute {
      name = "Brand"
      label = {
          da = "Brand"
          en = "Brand"
      }
      required = true
      constraint = "SameForAll"
      searchable = true
      type {
          name = "enum"
          values = {
              samsung = "Samsung"
              huawei = "Huawei"
              sony = "Sony"
              apple = "Apple"
              oneplus = "OnePlus"
              motorola = "Motorola"
          }
      }
  }
}
