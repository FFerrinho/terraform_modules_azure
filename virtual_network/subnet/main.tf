data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                                           = var.name
  resource_group_name                            = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name                           = data.azurerm_virtual_network.vnet.name
  address_prefixes                               = var.address_prefixes
  delegation                                     = var.delegation
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
  service_endpoints                              = var.service_endpoints
  service_endpoint_policy_ids                    = var.service_endpoint_policy_ids
}
