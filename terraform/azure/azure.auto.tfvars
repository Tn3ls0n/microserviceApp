rg = {
  name     = "rg-demoApp-dev-eastus"
  location = "eastus"
}

vnet = {
  name                = "vnet-demoApp-dev-eastus"
  resource_group_name = "rg-demoApp-dev-eastus"
  location            = "eastus"
  address_space       = ["10.1.0.0/16"]
}

aks = {
  subnet_name          = "aks-subnet-app-dev-eastus"
  subnet_addr_prefix   = ["10.1.2.0/24"]
  virtual_network_name = "vnet-demoApp-dev-eastus"
  name                 = "cluster-app-dev-eastus"
  location             = "eastus"
  resource_group_name  = "rg-demoApp-dev-eastus"
  dns_prefix           = "aks-dns"
  node_count           = 2
}

acr = {
  name                = "myUniqueContainerForAks"
  resource_group_name = "rg-demoApp-dev-eastus"
  location            = "eastus"
  sku                 = "Premium"
  admin_enabled       = false
}
