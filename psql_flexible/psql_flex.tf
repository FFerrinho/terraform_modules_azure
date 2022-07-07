resource "random_password" "psql_password" {
  length      = 12
  keepers     = var.password_keepers
  min_lower   = 2
  min_numeric = 2
  min_special = 2
  min_upper   = 2
}

resource "azurerm_postgresql_flexible_server" "psql" {
  name                              = var.psql_name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  administrator_login               = var.administrator_login
  administrator_password            = random_password.psql_password.result
  backup_retention_days             = var.backup_retention_days
  create_mode                       = var.create_mode
  delegated_subnet_id               = azurerm_subnet.psql_flex.id
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  point_in_time_restore_time_in_utc = var.point_in_time_restore_time_in_utc
  private_dns_zone_id               = var.private_dns_zone_id
  sku_name                          = var.sku_name
  source_server_id                  = var.source_server_id
  storage_mb                        = var.storage_mb
  version                           = var.psql_version
  zone                              = var.zone
  tags                              = var.tags
}

resource "azurerm_postgresql_flexible_server_configuration" "psql_config" {
  for_each  = var.psql_configuration
  name      = each.value.name
  server_id = azurerm_postgresql_flexible_server.psql.id
  value     = each.value.value
}

resource "azurerm_postgresql_flexible_server_database" "psql_db" {
  for_each  = var.psql_database
  name      = each.value.name
  server_id = azurerm_postgresql_flexible_server.psql.id
  charset   = each.value.charset
  collation = each.value.collation

  depends_on = [
    azurerm_postgresql_flexible_server_configuration.psql_config
  ]
}
