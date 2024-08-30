resource "random_id" "random_id" {
  byte_length = 8
}

resource "azurerm_storage_account" "vm_storage_account" {
  name                     = "diag${random_id.random_id.hex}"
  location                 = var.vm.location
  resource_group_name      = var.vm.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [random_id.random_id]
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "build_vm" {
  name                  = var.vm.name
  location              = var.vm.location
  resource_group_name   = var.vm.resource_group_name
  network_interface_ids = [var.nic_id]
  size                  = "Standard_DS1_v2"
  depends_on            = [azurerm_storage_account.vm_storage_account, tls_private_key.ssh]

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = var.vm.computer_name
  admin_username = var.vm.username

  admin_ssh_key {
    username   = var.vm.username
    public_key = tls_private_key.ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.vm_storage_account.primary_blob_endpoint
  }
}
