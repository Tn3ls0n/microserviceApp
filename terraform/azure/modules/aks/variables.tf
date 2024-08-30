variable "aks" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    node_count          = number
  })
}

variable "subnet_id" {
  type = any
}
