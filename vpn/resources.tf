resource "random_uuid" "random_uuid" {}

resource "time_sleep" "wait_1m" {
  create_duration = "1m"

  depends_on = [
    azurerm_public_ip.firewall,
    azurerm_virtual_network_gateway.vnet_gateway
  ]
}
