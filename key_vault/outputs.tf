output "id" {
  description = "The ID for the Azure Key Vault."
  value       = azurerm_key_vault.key_vault.id
}

output "virtual_networks" {
  value = data.azurerm_virtual_network.virtual_network
}
