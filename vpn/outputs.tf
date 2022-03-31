output "vpn_public_ip" {
  value = azurerm_public_ip.gateway.ip_address
}
