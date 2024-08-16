resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet.name
  resource_group_name = var.vnet.resource_group_name
  location            = var.vnet.location
  address_space       = var.vnet.address_space
}
