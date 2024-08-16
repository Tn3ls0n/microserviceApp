resource "azurerm_container_registry" "container_registry" {
  name                = var.acr.name
  resource_group_name = var.acr.resource_group_name
  location            = var.acr.location
  sku                 = var.acr.sku
  admin_enabled       = var.acr.admin_enabled

  #network_rule_set {
  #  default_action = "Deny"
  #  ip_rule = [{
  #    action   = "Allow"
  #    ip_range = "10.1.0.0/24"
  #  }]
  #}
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                            = azurerm_container_registry.container_registry.id
  role_definition_name             = "AcrPull"
  principal_id                     = var.kubelet_id
  skip_service_principal_aad_check = true
}
