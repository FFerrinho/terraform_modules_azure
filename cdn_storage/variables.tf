variable "identifier" {
  description = "The identifier for the CDN profile"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group for the environment"
  type        = string
}

variable "location" {
  description = "The location for the CDN profile"
  type        = string
  default     = "northeurope"
}

variable "account_kind" {
  description = "The kind of storage account to create"
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "The tier of the storage account to create"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type of the storage account to create"
  type        = string
  default     = "RAGZRS"
}

variable "access_tier" {
  description = "The access tier of the storage account to create"
  type        = string
  default     = "Hot"
}

variable "enable_https_traffic_only" {
  description = "Whether to enable HTTPS traffic only"
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "The minimum TLS version of the storage account to create"
  type        = string
  default     = "TLS1_2"
}

variable "shared_access_key_enabled" {
  description = "Whether to enable shared access key"
  type        = bool
  default     = true
}
variable "blob_versioning_enabled" {
  description = "Whether to enable blob versioning"
  type        = bool
  default     = false
}

variable "cors_enabled" {
  description = "Whether to enable CORS"
  type        = bool
  default     = false
}

variable "cors_allowed_headers" {
  description = "The allowed headers for CORS"
  type        = set(string)
  default     = ["*"]
}

variable "cors_allowed_methods" {
  description = "The allowed methods for CORS"
  type        = set(string)
  default     = ["DELETE", "GET", "HEAD", "MERGE", "POST", "OPTIONS", "PUT", "PATCH"]
}

variable "cors_allowed_origins" {
  description = "The allowed origins for CORS"
  type        = set(string)
}

variable "cors_exposed_headers" {
  description = "The exposed headers for CORS"
  type        = set(string)
  default     = ["*"]
}

variable "cors_max_age_in_seconds" {
  description = "The max age in seconds for CORS"
  type        = number
  default     = 3600
}

variable "static_website_error_404_document" {
  description = "The error 404 document for the static website"
  type        = string
  default     = null
}

variable "network_access_default_action" {
  description = "The default action for network access"
  type        = string
  default     = "Allow"
}

variable "network_access_allowed_subnet_ids" {
  description = "The allowed subnet ids for network access"
  type        = set(string)
  default     = []
}

variable "network_access_bypass" {
  description = "The bypasses for network access"
  type        = set(string)
  default     = ["AzureServices", "Logging", "Metrics"]
}

variable "large_file_share_enabled" {
  description = "Whether to enable large file share"
  type        = bool
  default     = false
}

variable "container_access_type" {
  description = "The access type for the blob container"
  type        = string
  default     = "blob"
}

variable "type" {
  description = "The type of storage blob to create"
  type        = string
  default     = "Block"
}

variable "size" {
  description = "The size of the storage blob to create"
  type        = number
  default     = 2048
}

variable "sku" {
  description = "The SKU for the CDN profile."
  type        = string
  default     = "Standard_Microsoft"
}

variable "is_http_allowed" {
  description = "Whether to allow HTTP traffic"
  type        = bool
  default     = true
}

variable "is_https_allowed" {
  description = "Whether to allow HTTPS traffic"
  type        = bool
  default     = true
}

variable "content_types_to_compress" {
  description = "The content types to compress"
  type        = set(string)
  default     = ["image/jpg", "image/tiff", "image/bmp", "image/png", "video/mp4"]
}

variable "is_compression_enabled" {
  description = "Whether to enable compression"
  type        = bool
  default     = true
}

variable "querystring_caching_behaviour" {
  description = "The querystring caching behaviour"
  type        = string
  default     = "IgnoreQueryString"
}

variable "optimization_type" {
  description = "The optimization type"
  type        = string
  default     = "GeneralWebDelivery"
}
