resource "azurerm_subnet" "firewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = var.firewall_cidr
}

resource "azurerm_public_ip" "firewall" {
  name                = "pip-${var.name}-firewall-${random_uuid.random_uuid.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.pip_sku
  allocation_method   = var.allocation_method
  availability_zone   = var.availability_zone

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_firewall" "fw" {
  name                = "fw-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_tier            = "Premium"

  ip_configuration {
    name                 = "fw-${var.name}-ip-configuration"
    subnet_id            = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }

  dns_servers = ["168.63.129.16"]
  tags        = var.tags

  depends_on = [
    azurerm_virtual_network_gateway.vnet_gateway,
    time_sleep.wait_1m
  ]
}
