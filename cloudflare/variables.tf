variable "zone_name" {
  description = "The name of the Cloudflare zone."
  type        = string
}

variable "plan" {
  description = "The plan of the Cloudflare zone."
  type        = string
  default     = "free"
}

variable "type" {
  description = "The type of the Cloudflare zone."
  type        = string
  default     = "full"
}

variable "always_online" {
  description = "If Cloudflare will provide a stale version of the website in case of downtime."
  type        = string
  default     = "off"
}

variable "always_use_https" {
  description = "If Cloudflare will always use HTTPS for the website."
  type        = string
  default     = "on"
}

variable "automatic_https_rewrites" {
  description = "If Cloudflare will automatically rewrite HTTP to HTTPS."
  type        = string
  default     = "on"
}

variable "brotli" {
  description = "If Cloudflare will use brotli compression."
  type        = string
  default     = "on"
}

variable "browser_check" {
  description = "If Cloudflare will check the browser before serving the website."
  type        = string
  default     = "on"
}

variable "development_mode" {
  description = "If Cloudflare will serve the website in development mode, bypassing cache."
  type        = string
  default     = "off"
}

variable "early_hints" {
  description = "If Cloudflare will send early hints to the browser."
  type        = string
  default     = "on"
}

variable "email_obfuscation" {
  description = "If Cloudflare will obfuscate the email addresses."
  type        = string
  default     = "on"
}

variable "filter_logs_to_cloudflare" {
  description = "If Cloudflare will filter logs to only send logs to Cloudflare."
  type        = string
  default     = null
}

variable "hotlink_protection" {
  description = "If Cloudflare will protect the website from hotlinking."
  type        = string
  default     = "on"
}

variable "http2" {
  description = "If Cloudflare will use HTTP2."
  type        = string
  default     = null
}

variable "http3" {
  description = "If Cloudflare will use HTTP3."
  type        = string
  default     = null
}

variable "ip_geolocation" {
  description = "If Cloudflare will use IP geolocation."
  type        = string
  default     = "on"
}

variable "ipv6" {
  description = "If Cloudflare will use IPv6."
  type        = string
  default     = null
}

variable "log_to_cloudflare" {
  description = "If Cloudflare will log to Cloudflare."
  type        = string
  default     = null
}

variable "mirage" {
  description = "If Cloudflare will use Mirage image optimization."
  type        = string
  default     = null
}

variable "opportunistic_encryption" {
  description = "If Cloudflare will use opportunistic encryption."
  type        = string
  default     = null
}

variable "opportunistic_onion" {
  description = "If Cloudflare will use opportunistic onion."
  type        = string
  default     = null
}
variable "orange_to_orange" {
  description = "If Cloudflare will use orange to orange."
  type        = string
  default     = "off"
}

variable "origin_error_page_pass_thru" {
  description = "If Cloudflare will pass through origin error pages."
  type        = string
  default     = null
}

variable "prefetch_preload" {
  description = "If Cloudflare will prefetch and preload the website."
  type        = string
  default     = null
}

variable "privacy_pass" {
  description = "If Cloudflare will use privacy pass."
  type        = string
  default     = null
}

variable "response_buffering" {
  description = "If Cloudflare will use response buffering."
  type        = string
  default     = null
}

variable "rocket_loader" {
  description = "If Cloudflare will use rocket loader."
  type        = string
  default     = "on"
}

variable "server_side_exclude" {
  description = "If Cloudflare will use server side exclude."
  type        = string
  default     = null
}

variable "sort_query_string_for_cache" {
  description = "If Cloudflare will sort query string for cache."
  type        = string
  default     = null
}

variable "tls_client_auth" {
  description = "If Cloudflare will use TLS client auth."
  type        = string
  default     = null
}

variable "true_client_ip_header" {
  description = "If Cloudflare will use true client ip header."
  type        = string
  default     = null
}

variable "universal_ssl" {
  description = "If Cloudflare will use universal SSL."
  type        = string
  default     = null
}

variable "visitor_ip" {
  description = "If Cloudflare will use visitor ip."
  type        = string
  default     = null
}

variable "waf" {
  description = "If Cloudflare will use WAF."
  type        = string
  default     = "off"
}

variable "webp" {
  description = "If Cloudflare will use webp."
  type        = string
  default     = null
}

variable "websockets" {
  description = "If Cloudflare will use websockets."
  type        = string
  default     = "off"
}

variable "zero_rtt" {
  description = "If Cloudflare will use zero RTT."
  type        = string
  default     = "on"
}

variable "cache_level" {
  description = "The cache level of the Cloudflare zone."
  type        = string
  default     = "aggressive"
}

variable "image_resizing" {
  description = "If Cloudflare will use image resizing."
  type        = string
  default     = null
}

variable "min_tls_version" {
  description = "The minimum TLS version of the Cloudflare zone."
  type        = string
  default     = "1.2"
}

variable "polish" {
  description = "If Cloudflare will use polish."
  type        = string
  default     = null
}

variable "security_level" {
  description = "The security level of the Cloudflare zone."
  type        = string
  default     = "high"
}

variable "browser_cache_ttl" {
  description = "The browser cache TTL of the Cloudflare zone."
  type        = number
  default     = 14400
}

variable "challenge_ttl" {
  description = "The challenge TTL of the Cloudflare zone."
  type        = number
  default     = 1800
}

variable "max_upload" {
  description = "The max upload size of the Cloudflare zone."
  type        = number
  default     = 100
}

variable "minify_css" {
  description = "If Cloudflare will minify CSS."
  type        = string
  default     = "on"
}

variable "minify_html" {
  description = "If Cloudflare will minify HTML."
  type        = string
  default     = "on"
}

variable "minify_js" {
  description = "If Cloudflare will minify JS."
  type        = string
  default     = "on"
}

variable "dns_records" {
  description = "The DNS records of the Cloudflare zone."
  type = map(object({
    record          = string
    type            = string
    ip              = string
    ttl             = number
    priority        = number
    proxied         = bool
    allow_overwrite = bool
  }))
}

variable "healtchecks" {
  description = "The healthchecks of the Cloudflare zone."
  type = map(object({
    name        = string
    description = string
    address     = string
    suspend     = bool
    type        = string
    
  }))
}
