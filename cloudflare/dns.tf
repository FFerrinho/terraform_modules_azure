resource "cloudflare_record" "dns" {
  for_each        = var.dns_records
  zone_id         = data.cloudflare_zone.zone.id
  name            = each.value.record
  type            = each.value.type
  value           = each.value.ip
  ttl             = each.value.ttl
  priority        = each.value.priority
  proxied         = each.value.proxied
  allow_overwrite = each.value.allow_overwrite
}
