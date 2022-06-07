resource "cloudflare_healthcheck" "http" {
    for_each = var.healtcheck
    zone_id = cloudflare_zone.zone.id
    name    = "https"
    description = "Check if the site is responding on HTTPs"
    address = "20.79.246.51"
    type = "HTTPS"
}
