variable "rg" {
  description = "Resource Group"
  type = object({
    name     = string
    location = string
  })
}

variable "vnet" {
  description = "Virual Network"
  type = object({
    name                   = string
    resource_group_name    = string
    location               = string
    address_space          = any
    aks_subnet_name        = string
    aks_subnet_addr_prefix = any
    vm_subnet_name         = string
    vm_subnet_addr_prefix  = any
    vm_subnet_nic_name     = string
  })
}

variable "vm" {
  description = "Virtual Machine"
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    computer_name       = string
    username            = string
  })
}

variable "agent" {
  description = "Azure DevOps Agent"
  type = object({
    username  = string
    host_name = string
    ado_org   = string
    ado_pat   = string
    ado_pool  = string
  })
}

variable "aks" {
  description = "Azure Kubernetes Service"
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    node_count          = number
  })
}

variable "acr" {
  description = "Azure Container Registry"
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
  })
}
