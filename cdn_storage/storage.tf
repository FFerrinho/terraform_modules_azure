resource "azurerm_storage_account" "cdn" {
  name                      = "st${local.identifier_sanitized}media"
  resource_group_name       = var.rg_name
  location                  = var.location
  account_kind              = var.account_kind
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  access_tier               = var.access_tier
  enable_https_traffic_only = var.enable_https_traffic_only
  min_tls_version           = var.min_tls_version
  shared_access_key_enabled = var.shared_access_key_enabled

  /* custom_domain {
    name          = "media.${var.identifier}.core.windows.net"
    use_subdomain = true
  } */

  identity {
    type = "SystemAssigned"
  }

  blob_properties {
    versioning_enabled = var.blob_versioning_enabled

    delete_retention_policy {
      days = 30
    }

    container_delete_retention_policy {
      days = 30
    }

    dynamic "cors_rule" {
      for_each = toset(var.cors_enabled ? ["cors"] : [])
      content {
        allowed_headers    = var.cors_allowed_headers
        allowed_methods    = var.cors_allowed_methods
        allowed_origins    = var.cors_allowed_origins
        exposed_headers    = var.cors_exposed_headers
        max_age_in_seconds = var.cors_max_age_in_seconds
      }
    }
  }

  static_website {
    error_404_document = var.static_website_error_404_document
  }

  network_rules {
    default_action             = var.network_access_default_action
    virtual_network_subnet_ids = var.network_access_allowed_subnet_ids
    bypass                     = var.network_access_bypass
  }

  large_file_share_enabled = var.large_file_share_enabled
}

resource "azurerm_storage_container" "cdn" {
  name                  = "ct-${var.identifier}"
  storage_account_name  = azurerm_storage_account.cdn.name
  container_access_type = var.container_access_type
}

/* resource "azurerm_storage_blob" "media" {
  name                   = "blb-${var.identifier}"
  storage_account_name   = azurerm_storage_account.cdn.name
  storage_container_name = azurerm_storage_container.cdn.name
  type                   = var.type
  size                   = var.size
  access_tier            = var.access_tier
} */
