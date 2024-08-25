resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = var.aks.name
  location            = var.aks.location
  resource_group_name = var.aks.resource_group_name
  dns_prefix          = var.aks.dns_prefix

  default_node_pool {
    name                = "default"
    node_count          = var.aks.node_count
    vm_size             = "Standard_DS2_v2"
    type                = "VirtualMachineScaleSets"
    zones               = [1, 2, 3]
    enable_auto_scaling = false
    vnet_subnet_id      = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
  }
}
