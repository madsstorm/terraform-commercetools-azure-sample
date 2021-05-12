resource "commercetools_channel" "preorder" {
  key = "preorder"
  roles = ["InventorySupply"]
  name = {
      da = "Preorder"
      en = "Preorder"
  }
  description = {
      da = "Preorder inventory"
      en = "Preorder inventory"
  }
}