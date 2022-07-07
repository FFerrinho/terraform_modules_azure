resource "azurerm_private_dns_zone" "dns" {
  name                = "${var.pdns_name}.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
  #soa_record          = var.soa_record
  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "pdns-vnet" {
  name                  = "${var.pdns_name}-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.dns.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = var.registration_enabled
  tags                  = var.tags
}
