variable "aks" {
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
