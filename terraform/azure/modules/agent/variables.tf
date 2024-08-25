variable "agent" {
  type = object({
    username  = string
    host_name = string
    ado_org   = string
    ado_pat   = string
    ado_pool  = string
  })
}

variable "vm_id" {
  type = any
}
