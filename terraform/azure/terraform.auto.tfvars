rg = {
  name     = "rg-demoApp-dev-eastus"
  location = "eastus"
}

vnet = {
  name                   = "vnet-dev-eastus"
  resource_group_name    = "rg-demoApp-dev-eastus"
  location               = "eastus"
  address_space          = ["10.1.0.0/16"]
  aks_subnet_name        = "aks-subnet-dev-eastus"
  aks_subnet_addr_prefix = ["10.1.2.0/24"]
  vm_subnet_name         = "vm-subnet-dev-eastus"
  vm_subnet_addr_prefix  = ["10.1.4.0/24"]
  vm_subnet_nic_name     = "vm-subnet-nic-dev-eastus"
}

vm = {
  name                = "vm-dev-eastus"
  resource_group_name = "rg-demoApp-dev-eastus"
  location            = "eastus"
  computer_name       = "build-vm-dev-eastus"
  username            = "iAmAdmin"
}

agent = {
  username  = "iAmAdmin"
  host_name = "build-vm-dev-eastus"
  ado_org   = ""
  ado_pat   = ""
  ado_pool  = "Default"
}

aks = {
  name                = "cluster-dev-eastus"
  location            = "eastus"
  resource_group_name = "rg-demoApp-dev-eastus"
  dns_prefix          = "aks-dns"
  node_count          = 2
}

acr = {
  name                = "myUniqueContainerForAks"
  resource_group_name = "rg-demoApp-dev-eastus"
  location            = "eastus"
  sku                 = "Premium"
  admin_enabled       = false
}
