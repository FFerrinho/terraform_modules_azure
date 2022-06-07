resource "azurerm_cdn_profile" "profile" {
  name                = "cdn-${var.identifier}-profile"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku
}

resource "azurerm_cdn_endpoint" "endpoint" {
  name                          = "cdn-${var.identifier}-endpoint"
  resource_group_name           = var.rg_name
  profile_name                  = azurerm_cdn_profile.profile.name
  location                      = var.location
  is_http_allowed               = var.is_http_allowed
  is_https_allowed              = var.is_https_allowed
  content_types_to_compress     = var.content_types_to_compress
  is_compression_enabled        = var.is_compression_enabled
  querystring_caching_behaviour = var.querystring_caching_behaviour
  optimization_type             = var.optimization_type

  origin {
    name      = "cdn-${var.identifier}-origin"
    host_name = azurerm_storage_account.cdn.primary_web_host
  }
}
