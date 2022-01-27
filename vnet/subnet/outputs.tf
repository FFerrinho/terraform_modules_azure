output "id" {
  description = "The ID for the subnet."
  value       = azurerm_subnet.subnet.id
}

output "cidr" {
  description = "The CIDR for the subnet."
  value       = azurerm_subnet.subnet.address_prefixes
}
