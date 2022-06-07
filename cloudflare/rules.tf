/* resource "cloudflare_page_rule" "force_https" {

  zone_id = cloudflare_zone.zone.id
  target  = cloudflare_record.www.hostname
  priority = var.priority
  actions {
    always_use_https         = true
    automatic_https_rewrites = "on"
    cache_by_device_type     = "off"
    cache_deception_armor    = "off"
    cache_level              = "bypass"
  }
}
 */
