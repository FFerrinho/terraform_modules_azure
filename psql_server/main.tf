resource "random_password" "psql_password" {
  length      = 24
  keepers     = var.password_keepers
  min_lower   = 2
  min_numeric = 2
  min_special = 2
  min_upper   = 2
}

resource "azurerm_postgresql_server" "psql" {
  name                              = var.psql_name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  sku_name                          = var.sku_name
  version                           = var.psql_version
  administrator_login               = var.administrator_login
  administrator_login_password      = local.administrator_login_password
  auto_grow_enabled                 = var.auto_grow_enabled
  backup_retention_days             = var.backup_retention_days
  create_mode                       = var.create_mode
  #creation_source_server_id         = var.creation_source_server_id
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  #restore_point_in_time             = var.restore_point_in_time
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced
  storage_mb                        = var.storage_mb
  tags                              = var.tags
}
