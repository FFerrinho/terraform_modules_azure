resource "azurerm_postgresql_flexible_server" "psql_flexible" {
  name                              = var.name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  administrator_login               = var.administrator_login
  administrator_password            = var.administrator_password
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  create_mode                       = var.create_mode
  delegated_subnet_id               = var.delegated_subnet_id
  private_dns_zone_id               = var.private_dns_zone_id
  high_availability                 = var.high_availability
  maintenance_window                = var.maintenance_window
  point_in_time_restore_time_in_utc = var.point_in_time_restore_time_in_utc
  sku_name                          = var.sku_name
  source_server_id                  = var.source_server_id
  storage_mb                        = var.storage_mb
  tags                              = var.tags
  version                           = var.version
  zone                              = var.zone
}
