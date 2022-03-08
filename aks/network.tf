resource "azurerm_subnet" "aks_subnet" {
  name                 = var.snet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.snet_address_prefixes
  service_endpoints    = var.service_endpoints
}