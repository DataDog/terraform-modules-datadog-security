resource "azurerm_resource_group" "rg" {
  name     = var.resource-group-name
  location = var.resource-group-location
}