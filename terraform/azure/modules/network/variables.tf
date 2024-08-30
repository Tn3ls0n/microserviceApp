variable "vnet" {
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
