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

variable "nic_id" {
  type = any
}
