### PSQL Flexible Server
variable "psql_name" {
  description = "Name of the PostgreSQL server"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the PostgreSQL server"
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

variable "geo_redundant_backup" {
  description = "Enable Geo-redundant backups"
  type        = bool
  default     = false
}

variable "create_mode" {
  description = "Create mode of the PostgreSQL server. This can be \"Default\" or \"PointInTimeRestore\""
  type        = string
  default     = "Default"
}

variable "high_availability" {
  description = "Enable High Availability"
  type = map(object({
    mode                      = string
    standby_availability_zone = string
  }))
  default = null
}

variable "maintenance_window" {
  description = "Maintenance window"
  type = map(object({
    day_of_week  = number
    start_hour   = number
    start_minute = number
  }))
  default = null
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

variable "delegation" {
  description = "Delegation for the subnet"
  type        = map(string)
}

variable "subnet_delegation" {
  description = "Name for the subnet delegation name"
  type        = string
  default     = "psql_flex"
}
