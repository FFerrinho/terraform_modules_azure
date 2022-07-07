output "vnet_id" {
  description = "The ID for the Virtual Network."
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name for the Virtual Network."
  value       = azurerm_virtual_network.vnet.name
}

output "pdns_name" {
  description = "The name for the Private DNS Zone."
  value       = azurerm_private_dns_zone.dns.name
}

output "pdns_id" {
  description = "The name for the Private DNS Zone."
  value       = azurerm_private_dns_zone.dns.id
}
