output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}
output "vm_subnet_nic" {
  value = azurerm_network_interface.vm_subnet_nic.id
}
