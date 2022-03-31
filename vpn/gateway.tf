resource "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = var.gateway_cidr
}

resource "azurerm_public_ip" "gateway" {
  name                = "pip-${var.name}-vpn-gateway-${random_uuid.random_uuid.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.pip_sku
  allocation_method   = var.allocation_method
  availability_zone   = var.availability_zone
  tags                = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_virtual_network_gateway" "vnet_gateway" {
  name                = "vgw-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  type                = "Vpn"
  vpn_type            = var.vpn_type
  sku                 = var.sku
  generation          = var.generation

  ip_configuration {
    name                 = "vgw-${var.name}-ip-configuration"
    subnet_id            = azurerm_subnet.gateway.id
    public_ip_address_id = azurerm_public_ip.gateway.id
  }

  vpn_client_configuration {
    address_space = var.vpn_cidr
    /* aad_tenant    = var.aad_tenant
    aad_audience  = var.aad_audience
    aad_issuer    = var.aad_issuer */

    root_certificate {
      name             = var.root_certificate_name
      public_cert_data = var.public_cert_data
    }

    vpn_client_protocols = var.vpn_client_protocols
    vpn_auth_types       = var.vpn_auth_types
  }

  tags = var.tags
}
