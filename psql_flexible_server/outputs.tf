output "id" {
  description = "The ID of the PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.psql_flexible.id
}

output "fqdn" {
  description = "The FQDN of the PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.psql_flexible.fqdn
}

output "public_network_access_enabled" {
  description = "Is public network access enabled?"
  value       = azurerm_postgresql_flexible_server.psql_flexible.public_network_access_enabled
}
