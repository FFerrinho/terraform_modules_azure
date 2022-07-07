output "psql_flex_name" {
  description = "The name of the PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.psql.name
}

output "psql_flex_id" {
  description = "The ID of the PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.psql.id
}

output "db_password" {
  description = "The randomly generated password for the databases."
  value       = random_password.psql_password.result
}
