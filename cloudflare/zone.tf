resource "cloudflare_zone" "zone" {
  zone = var.zone_name
  plan = var.plan
  type = var.type
}

resource "cloudflare_zone_settings_override" "zone_settings_override" {
  zone_id = cloudflare_zone.zone.id
  settings {
    always_online               = var.always_online
    always_use_https            = var.always_use_https
    automatic_https_rewrites    = var.automatic_https_rewrites
    brotli                      = var.always_online
    browser_check               = var.browser_check
    development_mode            = var.development_mode
    early_hints                 = var.early_hints
    email_obfuscation           = var.email_obfuscation
    filter_logs_to_cloudflare   = var.filter_logs_to_cloudflare
    hotlink_protection          = var.hotlink_protection
    http2                       = var.http2
    http3                       = var.http3
    ip_geolocation              = var.ip_geolocation
    ipv6                        = var.ipv6
    log_to_cloudflare           = var.log_to_cloudflare
    mirage                      = var.mirage
    opportunistic_encryption    = var.opportunistic_encryption
    opportunistic_onion         = var.opportunistic_onion
    orange_to_orange            = var.orange_to_orange
    origin_error_page_pass_thru = var.origin_error_page_pass_thru
    prefetch_preload            = var.prefetch_preload
    privacy_pass                = var.privacy_pass
    response_buffering          = var.response_buffering
    rocket_loader               = var.rocket_loader
    server_side_exclude         = var.server_side_exclude
    sort_query_string_for_cache = var.sort_query_string_for_cache
    tls_client_auth             = var.tls_client_auth
    true_client_ip_header       = var.true_client_ip_header
    universal_ssl               = var.universal_ssl
    visitor_ip                  = var.visitor_ip
    waf                         = var.waf
    webp                        = var.webp
    websockets                  = var.websockets
    zero_rtt                    = var.zero_rtt
    cache_level                 = var.cache_level
    image_resizing              = var.image_resizing
    min_tls_version             = var.min_tls_version
    polish                      = var.polish
    security_level              = var.security_level
    browser_cache_ttl           = var.browser_cache_ttl
    challenge_ttl               = var.challenge_ttl
    max_upload                  = var.max_upload

    minify {
      css  = var.minify_css
      html = var.minify_html
      js   = var.minify_js
    }
  }
}
