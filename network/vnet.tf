resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  location            = var.location
  dns_servers         = var.dns_server
  tags                = var.tags

  lifecycle {
    ignore_changes = [subnet]
  }
}
