data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet_list" {
  count               = length(var.peered_vnets)
  name                = var.peered_vnets[count.index].vnet_name
  resource_group_name = var.peered_vnets[count.index].rg_name
}

data "azurerm_private_dns_zone" "pdns_list" {
  count               = length(var.private_dns_zones)
  name                = var.private_dns_zones[count.index].pdns_name
  resource_group_name = var.private_dns_zones[count.index].rg_name
}
