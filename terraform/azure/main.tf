module "rg" {
  source = "./modules/rg"
  rg     = var.rg
}

module "network" {
  source     = "./modules/network"
  vnet       = var.vnet
  depends_on = [module.rg]
}

module "vm" {
  source     = "./modules/vm"
  vm         = var.vm
  nic_id     = module.network.vm_subnet_nic
  depends_on = [module.network]
}

module "agent" {
  source     = "./modules/agent"
  agent      = var.agent
  vm_id      = module.vm.vm_id
  depends_on = [module.vm]
}

module "aks" {
  source     = "./modules/aks"
  aks        = var.aks
  subnet_id  = module.network.aks_subnet_id
  depends_on = [module.vnet]
}

module "acr" {
  source     = "./modules/acr"
  acr        = var.acr
  kubelet_id = module.aks.aks_kubelet.0.object_id
  depends_on = [module.aks]
}
