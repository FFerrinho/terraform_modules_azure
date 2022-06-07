/* resource "cloudflare_waf_package" "waf" {
  for_each = toset(var.waf ? ["waf"] : [])

  zone_id = cloudflare_zone.zone.id
}
 */
