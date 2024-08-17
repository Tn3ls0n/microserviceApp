resource "azurerm_subnet" "aci_subnet" {
  name                 = var.aci.subnet_name
  resource_group_name  = var.aci.resource_group_name
  virtual_network_name = var.aci.virtual_network_name
  address_prefixes     = var.aci.subnet_addr_prefix

  delegation {
    name = "acidelegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}
