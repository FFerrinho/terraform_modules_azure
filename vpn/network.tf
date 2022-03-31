resource "azurerm_virtual_network_dns_servers" "vpn" {
  virtual_network_id = data.azurerm_virtual_network.vnet.id
  dns_servers        = [azurerm_firewall.fw.ip_configuration[0].private_ip_address]
}

resource "azurerm_virtual_network_peering" "vpn_2_vnet" {
  count                     = length(data.azurerm_virtual_network.vnet_list)
  name                      = "peering-vpn"
  resource_group_name       = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.vnet_list[count.index].id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = true
}

resource "azurerm_virtual_network_peering" "vnet_2_vpn" {
  count                     = length(data.azurerm_virtual_network.vnet_list)
  name                      = "peering-vpn"
  resource_group_name       = data.azurerm_virtual_network.vnet_list[count.index].resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.vnet_list[count.index].name
  remote_virtual_network_id = data.azurerm_virtual_network.vnet.id
  allow_forwarded_traffic   = true
  use_remote_gateways       = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "pdns_link" {
  count                 = length(data.azurerm_private_dns_zone.pdns_list)
  name                  = "peering-vpn"
  private_dns_zone_name = data.azurerm_private_dns_zone.pdns_list[count.index].name
  resource_group_name   = data.azurerm_private_dns_zone.pdns_list[count.index].resource_group_name
  virtual_network_id    = data.azurerm_virtual_network.vnet.id
  depends_on = [
    azurerm_firewall.fw
  ]
}

