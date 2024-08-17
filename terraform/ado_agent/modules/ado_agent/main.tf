resource "azurerm_subnet" "aci_subnet" {
  name                 = var.aci.subnet_name
  resource_group_name  = var.aci.resource_group_name
  virtual_network_name = var.aci.virtual_network_name
  address_prefixes     = var.aci.subnet_addr_prefix

  delegation {
    name = "acidelegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

#TODO: ADD VARIABLES TO MODULE..
module "aci-devops-agent" {
  source                = "Azure/aci-devops-agent/azurerm"
  resource_group_name   = "rg-aci-devops"
  location              = "westeurope"
  create_resource_group = true

  enable_vnet_integration  = true
  vnet_resource_group_name = azurerm_resource_group.vnet-rg.name
  vnet_name                = azurerm_virtual_network.vnet.name
  subnet_name              = azurerm_subnet.aci-subnet.name

  linux_agents_configuration = {
    agent_name_prefix = "linuxagent"
    count             = 5
    docker_image      = "DOCKER_IMAGE_NAME"
    docker_tag        = "DOCKER_IMAGE_TAG"
    agent_pool_name   = "private-aci-pool"
    cpu               = 1
    memory            = 4
  }
  azure_devops_org_name              = "DEVOPS_ORG_NAME"
  azure_devops_personal_access_token = "DEVOPS_ACCESS_TOKEN"
}
