variable "aks_name" {
  description = "The name for the Azure Kubernetes Cluster"
  type        = string
}

variable "location" {
  description = "The location for the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name for the resource group."
  type        = string
}

variable "vnet_name" {
  description = "The name for the vnet"
}

variable "vm_size" {
  description = "The size for the VMs in the default node pool."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "availability_zones" {
  description = "A list of availability zones to use with the node pool."
  type        = list(string)
  default     = null
}

variable "enable_auto_scaling" {
  description = "If autoscaling is enabled for the default node pool."
  type        = bool
  default     = false
}

variable "max_count" {
  description = "The maximum number of nodes for the pool auto-scaling."
  type        = number
  default     = 6
}

variable "min_count" {
  description = "The minimum number of nodes for the pool auto-scaling."
  type        = number
  default     = 3
}

variable "node_count" {
  description = "The initial number of nodes for the pool."
  type        = number
  default     = 3
}

variable "orchestrator_version" {
  description = "The Kubernetes version to use with the agents."
  type        = number
  default     = null
}

variable "os_disk_type" {
  description = "The type of disk for the nodes. Can be Ephemeral or Managed, while Ephemeral aren't good for persistence, they are faster and less expensive."
  type        = string
  default     = "Ephemeral"
}

variable "type" {
  description = "The type of node pool."
  type        = string
  default     = "VirtualMachineScaleSets"
}

variable "vnet_subnet_id" {
  description = "The ID for the subnet to use with the nodes."
  type        = string
}

variable "automatic_channel_upgrade" {
  description = "The upgrade channel for the Kubernetes cluster. Omitting this field sets this value to 'none'."
  type        = string
  default     = null
}

variable "log_workspace_name" {
  description = "The name for the Log Analytics Workspace."
  type        = string
}

variable "sku" {
  description = "The SKU for the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The number of days thr logs will be retained. Range between 30 and 730."
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "The workspace daily quota for log ingestion."
  type        = number
  default     = null
}

variable "snet_name" {
  description = "The name for the subnet."
  type        = string
}

variable "snet_address_prefixes" {
  description = "The CIDR for the subnet."
  type        = list(string)
}

variable "service_endpoints" {
  description = "The service endpoints for the subnet."
  type        = list(string)
  default     = ["Microsoft.ContainerRegistry", "Microsoft.Storage"]
}
