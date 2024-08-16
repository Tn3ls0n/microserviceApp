variable "vnet" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = any
  })
}
