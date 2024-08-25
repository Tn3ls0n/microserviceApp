locals{
    custom_script_content = templatefile("${path.module}/script.sh".
        {
            organization = var.organization

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
  "script": 
 }
SETTINGS
}
