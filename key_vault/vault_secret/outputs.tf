output "id" {
  description = "The Key Vault Secret ID."
  value       = azurerm_key_vault_secret.secret.id
}

output "version" {
  description = "The current version of the Key Vault Secret."
  value       = azurerm_key_vault_secret.secret.version
}

output "versionless_id" {
  description = "The Base ID of the Key Vault Secret."
  value       = azurerm_key_vault_secret.secret.versionless_id
}
