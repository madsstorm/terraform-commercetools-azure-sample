resource "commercetools_channel" "preorder" {
  key   = "preorder"
  roles = ["InventorySupply"]
  name = {
    da = "Preorder"
  }
  description = {
    da = "Preorder inventory"
  }
}