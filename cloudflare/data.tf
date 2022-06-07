data "cloudflare_zone" "zone" {
  name = cloudflare_zone.zone.zone
}

data "cloudflare_waf_packages" "waf" {
  zone_id = data.cloudflare_zone.zone.id
}
