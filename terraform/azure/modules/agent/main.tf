locals {
  custom_script_content = templatefile("${path.module}/script.sh",
    {
      username  = "${var.agent.username}"
      host_name = "${var.agent.host_name}"
      ado_org   = "${var.agent.ado_org}"
      ado_pat   = "${var.agent.ado_pat}"
      ado_pool  = "${var.agent.ado_pool}"
    }
  )
}

resource "azurerm_virtual_machine_extension" "agent" {
  name                 = "hostname"
  virtual_machine_id   = var.vm_id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
 {
  "script": "${base64encode(local.custom_script_content)}"
 }
SETTINGS
}
