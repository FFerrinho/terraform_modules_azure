output "id" {
  description = "The Key Vault Key ID."
  value       = azurerm_key_vault_key.key.id
}

output "version" {
  description = "The current version of the Key Vault Key."
  value       = azurerm_key_vault_key.key.version
}

output "versionless_id" {
  description = "The Base ID of the Key Vault Key."
  value       = azurerm_key_vault_key.key.versionless_id
}

output "public_key_pem" {
  description = "The PEM encoded public key of this Key Vault Key."
  value       = azurerm_key_vault_key.key.public_key_pem
}

output "public_key_openssh" {
  description = "The OpenSSH encoded public key of this Key Vault Key."
  value       = azurerm_key_vault_key.key.public_key_openssh
}
