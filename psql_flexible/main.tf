resource "random_password" "psql_password" {
  length      = 24
  keepers     = var.password_keepers
  min_lower   = 2
  min_numeric = 2
  min_special = 2
  min_upper   = 2
}

resource "azure_postgresql_flexible_server" "test_psql" {
  name                              = var.psql_name
  resource_group_name               = var.resource_group.name
  location                          = var.location
  administrator_login               = var.admin_login
  administrator_password            = random_password.psql_password.value
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup              = var.geo_redundant_backup
  create_mode                       = var.create_mode
  delegation_subnet_id              = var.delegation_subnet_id
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
