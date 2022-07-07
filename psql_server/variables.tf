variable "psql_name" {
  description = "The name for the PostgreSQL server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure location for the server."
  type        = string
}

variable "sku_name" {
  description = "Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)"
  type        = string
  default     = "GP_Gen5_2"
}

variable "psql_version" {
  description = "The PostgreSQL version. Note that on stand alone he maximum version supported is 11."
  type        = number
  default     = 11
}

variable "administrator_login" {
  description = "The administrator login fr the PostgreSQL."
  type        = string
  default     = "psql_admin"
}

variable "administrator_login_password" {
  description = "The password for the PostgreSQL administrator. If no value is provided, the module will generate a complex random password."
  type        = string
  default     = null
}

variable "auto_grow_enabled" {
  description = "If storage auto-growing is enabled. If disabled and server runs out of space, the database will become read-only until fixed."
  type        = bool
  default     = true
}

variable "backup_retention_days" {
  description = "The number of days to keep the backups."
  type        = number
  default     = 7
}

variable "create_mode" {
  description = "The create mode for the PostgreSQL. Possible values are Default, Replica, GeoRestore and PointInTimeRestore."
  type        = string
  default     = "Default"
}

variable "creation_source_server_id" {
  description = "The source server ID. To use when creating the database as a restore."
  type        = string
  default     = null
}

variable "geo_redundant_backup_enabled" {
  description = "If geo-redundant backups are enabled."
  type        = bool
  default     = false
}

variable "infrastructure_encryption_enabled" {
  description = "If the infrastructure is encrypted for this server."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "If the PostgreSQL allows access via public networks."
  type        = bool
  default     = false
}

variable "restore_point_in_time" {
  description = "The point in time to restore the server, if the create_mode was set to PointInTimeRestore."
  type        = string
  default     = null
}

variable "ssl_enforcement_enabled" {
  description = "If SSL is enforced for the connections to this PostgreSQL instance."
  type        = bool
  default     = true
}

variable "ssl_minimal_tls_version_enforced" {
  description = "The minimum version for the TLS."
  type        = string
  default     = "TLS1_2"
}

variable "storage_mb" {
  description = "The maximum storage allowed for the PostgreSQL."
  type        = number
  default     = 1048576
}

variable "tags" {
  description = "Tags to assign to the PostgreSQL server"
  type        = map(string)
  default = {
    provisioner = "terraform"
    environment = "development"
  }
}

variable "password_keepers" {
  description = "Password keepers"
  type        = map(string)
  default = {
    default = "default"
  }
}
