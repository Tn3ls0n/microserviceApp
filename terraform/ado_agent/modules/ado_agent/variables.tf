variable "aci" {
  description = "Azure Container Instance"
  type = object({
    subnet_name          = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_addr_prefix   = any
  })
}
