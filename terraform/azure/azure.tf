module "rg" {
  source = "./modules/rg"
  rg     = var.rg
}

module "vnet" {
  source     = "./modules/vnet"
  vnet       = var.vnet
  depends_on = [module.rg]
}

module "aks" {
  source     = "./modules/aks"
  aks        = var.aks
  depends_on = [module.vnet]
}

module "acr" {
  source     = "./modules/acr"
  acr        = var.acr
  kubelet_id = module.aks.aks_kubelet.0.object_id
  depends_on = [module.aks]
}
