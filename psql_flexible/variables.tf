### Random Password

variable "password_keepers" {
  description = "Password keepers"
  type        = map(string)
  default = {
    default = "default"
  }
}

### Common variables
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the PostgreSQL server"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the PostgreSQL server"
  type        = map(string)
  default = {
    provisioner = "terraform"
    environment = "development"
  }
}

### PSQL Flexible Server
variable "psql_name" {
  description = "Name of the PostgreSQL server"
  type        = string
}

variable "administrator_login" {
  description = "Administrator login for the PostgreSQL server"
  type        = string
  default     = "postgres"
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "create_mode" {
  description = "Create mode of the PostgreSQL server. This can be \"Default\" or \"PointInTimeRestore\""
  type        = string
  default     = "Default"
}

variable "geo_redundant_backup_enabled" {
  description = "Enable Geo-redundant backups"
  type        = bool
  default     = false
}

variable "high_availability" {
  description = "Enable High Availability"
  type = object({
    mode                      = string
    standby_availability_zone = number
  })
  default = {
    mode                      = "ZoneRedundant"
    standby_availability_zone = 1
  }
}

variable "maintenance_window" {
  description = "Maintenance window"
  type = object({
    day_of_week  = number
    start_hour   = number
    start_minute = number
  })
  default = null
}

variable "point_in_time_restore_time_in_utc" {
  description = "Point in time restore time in UTC"
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "Private DNS zone ID for the Flexible Server. Changing this value will force the resource to be recreated."
  type        = string
}

variable "sku_name" {
  description = "SKU name of the PostgreSQL server"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "source_server_id" {
  description = "value of the source server id. Required when create_mode is PointInTimeRestore, GeoRestore, and Replica. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "storage_mb" {
  description = "The size for the storage associated with the PostgreSQL Flexible server."
  type        = number
}

variable "psql_version" {
  description = "Version of the PostgreSQL server."
  type        = string
  default     = "13"
}

variable "zone" {
  description = "Availability zone. Possible values are 1, 2 and 3."
  type        = number
  default     = 1
}

variable "psql_configuration" {
  description = "Configurations for the PostgreSQL server."
  type = map(object({
    name  = string
    value = string
  }))
  default = null
}

### PSQL Database
variable "psql_database" {
  description = "List of databases to create"
  type = map(object({
    name      = string
    charset   = string
    collation = string
  }))
}

variable "replica_tables" {
  description = "The database tables that are to be replicated to the secondary server(s)."
  type        = set(string)
  default     = null
}

### PSQL Subnet
variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "psql_flex"
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

variable "enforce_private_link_endpoint_network_policies" {
  description = "If Network Policies are enabled for the private link endpoint on this subnet."
  type        = bool
  default     = false
}

variable "enforce_private_link_service_network_policies" {
  description = "If Network Policies are enabled for the private link service on this subnet."
  type        = bool
  default     = false
}

variable "service_endpoints" {
  description = "Service endpoints for the subnet."
  type        = set(string)
  default     = null
}

variable "service_endpoint_policy_ids" {
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  type        = set(string)
  default     = null
}
