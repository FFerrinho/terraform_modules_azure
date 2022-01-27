variable "name" {
  description = "(Required) The name which should be used for this PostgreSQL Flexible Server. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}

variable "location" {
  description = "(Required) The Azure Region where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}

variable "administrator_login" {
  description = "(Optional) The Administrator Login for the PostgreSQL Flexible Server. Required when create_mode is Default. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "administrator_password" {
  description = "(Optional) The Password associated with the administrator_login for the PostgreSQL Flexible Server. Required when create_mode is Default."
  type        = string
  default     = null
}

variable "backup_retention_days" {
  description = "(Optional) The backup retention days for the PostgreSQL Flexible Server. Possible values are between 7 and 35 days."
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "(Optional) Is Geo-Redundant backup enabled on the PostgreSQL Flexible Server. Defaults to false. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = bool
  default     = false
}

variable "create_mode" {
  description = "(Optional) The creation mode which can be used to restore or replicate existing servers. Possible values are Default and PointInTimeRestore. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
  default     = "Default"
}

variable "delegated_subnet_id" {
  description = "(Optional) The ID of the virtual network subnet to create the PostgreSQL Flexible Server. The provided subnet should not have any other resource deployed in it and this subnet will be delegated to the PostgreSQL Flexible Server, if not already delegated. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "(Optional) The ID of the private dns zone to create the PostgreSQL Flexible Server. Changing this forces a new PostgreSQL Flexible Server to be created. The azurerm_private_dns_zone should end with suffix .postgres.database.azure.com."
  type        = string
  default     = null
}

variable "high_availability" {
  description = "(Optional) A high_availability block as defined in https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server."
  type        = map(any)
  default     = null
}

variable "maintenance_window" {
  description = "(Optional) A maintenance_window block as defined below. All values default to 0"
  type        = map(any)
  default = {
    day_of_week  = 0 # (Optional) The day of week for maintenance window. Defaults to 0.
    start_hour   = 0 # (Optional) The day of week for maintenance window. Defaults to 0.
    start_minute = 0 # (Optional) The start minute for maintenance window. Defaults to 0.
  }
}

variable "point_in_time_restore_time_in_utc" {
  description = "(Optional) The point in time to restore from creation_source_server_id when create_mode is PointInTimeRestore. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "sku_name" {
  description = "(Optional) The SKU Name for the PostgreSQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3)."
  type        = string
  default     = null
}

variable "source_server_id" {
  description = "(Optional) The resource ID of the source PostgreSQL Flexible Server to be restored. Required when create_mode is PointInTimeRestore. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "storage_mb" {
  description = "(Optional) The max storage allowed for the PostgreSQL Flexible Server. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216, and 33554432."
  type        = number
  default     = 32768
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the PostgreSQL Flexible Server."
  type        = map(string)
  default = {
    Managed = "Terraform"
  }
}

variable "version" {
  description = "(Optional) The version of PostgreSQL Flexible Server to use. Possible values are 11,12 and 13. Required when create_mode is Default. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "zone" {
  description = "(Optional) The Availability Zone of the PostgreSQL Flexible Server. Possible values are 1, 2 and 3."
  type        = number
  default     = 1
}
