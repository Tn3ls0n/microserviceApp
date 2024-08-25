resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet.name
  resource_group_name = var.vnet.resource_group_name
  location            = var.vnet.location
  address_space       = var.vnet.address_space
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.vnet.aks_subnet_name
  resource_group_name  = var.vnet.resource_group_name
  virtual_network_name = var.vnet.name
  address_prefixes     = var.vnet.aks_subnet_addr_prefix
  depends_on           = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "vm_subnet" {
  name                 = var.vnet.vm_subnet_name
  resource_group_name  = var.vnet.resource_group_name
  virtual_network_name = var.vnet.name
  address_prefixes     = var.vnet.vm_subnet_addr_prefix
  depends_on           = [azurerm_virtual_network.vnet]
}

resource "azurerm_network_interface" "vm_subnet_nic" {
  name                = var.vnet.vm_subnet_nic_name
  location            = var.vnet.location
  resource_group_name = var.vnet.resource_group_name
  depends_on          = [azurerm_subnet.vm_subnet]

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
