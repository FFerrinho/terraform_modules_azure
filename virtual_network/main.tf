resource "azurerm_virtual_network" "virtual_network" {
  name                    = var.name
  resource_group_name     = var.resource_group
  address_space           = var.address_space
  location                = var.location
  bgp_community           = var.bgp_community
  dns_servers             = var.dns_servers
  flow_timeout_in_minutes = var.flow_timeout_in_minutes
  tags                    = var.tags
}
