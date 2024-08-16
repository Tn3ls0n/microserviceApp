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
    name                = string
    resource_group_name = string
    location            = string
    address_space       = any
  })
}

variable "aks" {
  description = "Azure Kubernetes Service"
  type = object({
    subnet_name          = string
    subnet_addr_prefix   = any
    virtual_network_name = string
    name                 = string
    location             = string
    resource_group_name  = string
    dns_prefix           = string
    node_count           = number
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
