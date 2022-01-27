variable "aks_name" {
  description = "The name for the Azure Kubernetes Cluster."
  type        = string
}

variable "aks_location" {
  description = "The location for the Azure Kubernetes Cluster"
  type        = string
  default     = "germanywestcentral"
}

variable "aks_resource_group" {
  description = "The resource group to use for the Azure Kubernetes Cluster."
  type        = string
}

variable "aks_node_pool_name" {
  description = "The name for the node pool to be used by the Azure Kubernetes Cluster."
  type        = string
}

variable "aks_node_pool_count" {
  description = "How many nodes are intended to exist in the Azure Kubernetes Cluster pool."
  type        = number
  default     = 3
}

variable "aks_node_pool_vm_size" {
  description = "The size of the node instances for the Azure Kubernetes Cluster. You can use az vm list-sizes --location \"germanywestcentral\" -o table to list the available sizes."
  type        = string
}

variable "aks_node_pool_availability_zones" {
  description = "The availability zones for the Azure Kubernetes Cluster node pool."
  type        = list(string)
  default     = ["1"]
}

variable "aks_node_pool_auto_scaling" {
  description = "If the node pool has auto-scaling enabled."
  type        = bool
  default     = false
}

variable "aks_node_pool_max_count" {
  description = "The maximum number of nodes in the node pool, when auto scaling is enabled."
  type        = number
  default     = 5
}

variable "aks_node_pool_min_count" {
  description = "The minimum number of nodes in the node pool, when auto scaling is enabled."
  type        = number
  default     = 2
}

variable "aks_node_pool_public_ip" {
  description = "If the node pool has a public IP assigned."
  type        = bool
  default     = false
}

variable "aks_node_pool_labels" {
  description = "Labels to be assigned to the nodes in the node pool."
  type        = map(any)
  default = {
    "Managed" = "Terraform"
  }
}

variable "aks_node_pool_os_sku" {
  description = "The OS used by the cluster nodes. Can be Ubuntu or CBLMariner."
  type        = string
  default     = "Ubuntu"
}

variable "aks_node_pool_type" {
  description = "The type for the node pool used in Azure Kubernetes Cluster."
  type        = string
  default     = "VirtualMachineScaleSets"
}

variable "aks_dns_prefix" {
  description = "The DNS prefix to use with the Azure Kubernetes Cluster."
  type        = string
}

variable "aks_automatic_upgrade" {
  description = "The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable."
  type        = string
  default     = null
}

variable "aks_oms_agent_enabled" {
  description = "If the OMS agent is enabled."
  type        = bool
  default     = false
}

variable "aks_oms_agent_log_analytics_workspace_id" {
  description = "The oms agent to use with the cluster."
  type        = string
  default     = null
}

variable "aks_ingress_application_gateway_enabled" {
  description = "If the cluster has an application gateway associated with it."
  type        = bool
  default     = false
}

variable "aks_ingress_application_gateway_id" {
  description = "The ID of the Application Gateway to integrate with the ingress controller of this Kubernetes Cluster."
  type        = string
  default     = null
}

variable "aks_auto_scaler_profile_expander" {
  description = "The policy for the auto scaler. Check https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#what-are-expanders"
  type        = string
  default     = "random"
}

variable "aks_auto_scaler_profile_graceful_termination" {
  description = "The maximum number of seconds for pod termination when trying to scale down a node."
  type        = number
  default     = 600
}

variable "aks_auto_scaler_profile_max_provisioning_time" {
  description = "The maximum time the autoscaler waits for a node to be provisioned."
  type        = string
  default     = "15m"
}

variable "aks_auto_scaler_profile_unready_percentage" {
  description = "The maximum percentage of nodes unready. Autoscaler will stop if percentage is reached."
  type        = number
  default     = 45
}

variable "aks_identity" {
  description = "The identity base for Azure Kubernetes Cluster."
  type        = string
  default     = "SystemAssigned"
}

variable "aks_version" {
  description = "The Kubernetes version to be used in the cluster."
  type        = string
  default     = null
}

variable "aks_local_account_disabled" {
  description = "Disable local accounts for Azure Kubernetes Cluster"
  type        = bool
  default     = true
}

variable "aks_maintenance_window_allowed_day" {
  description = "The day for the cluster maintenance window."
  type        = string
  default     = "Saturday"
}

variable "aks_maintenance_window_allowed_hours" {
  description = "The hours allowed for the maintenance window."
  type        = list(number)
  default     = [0, 1]
}

variable "aks_network_profile_plugin" {
  description = "If the cluster will use the managed service for network (kubenet) or custom settings (azure)"
  type        = string
  default     = "kubenet"
}

variable "aks_network_profile_dns_service_ip" {
  description = "The DNS IP to be used by the network."
  type        = string
}

variable "aks_network_profile_outbound_type" {
  description = "The egress routing method used by Azure Kubernetes Cluster."
  type        = string
  default     = "loadBalancer"
}

variable "aks_network_profile_service_cidr" {
  description = "The CIDR for the Kubernetes services."
  type        = string
}

variable "aks_node_resource_group" {
  description = "The resource group to be used by the node pool."
  type        = string
}

variable "aks_public_network_access" {
  description = "If the cluster is accessible from a public network."
  type        = bool
  default     = false
}

variable "aks_role_based_access_control_enabled" {
  description = "If the cluster used RBAC."
  type        = bool
  default     = true
}

variable "aks_tags" {
  description = "The tags to apply to the Azure Kubernetes Cluster"
  type        = map(any)
  default = {
    "Managed" = "Terraform"
  }
}

variable "log_analytics_workspace_name" {
  description = "The name for the log analytics workspace."
  type        = string
}

variable "log_analytics_workspace_retention" {
  description = "The number of days the logs will be kept."
  type        = number
  default     = 30
}

variable "log_analytics_workspace_sku" {
  description = "The SKU for the workspace."
  type        = string
  default     = "PerGB2018"
}

variable "log_analytics_workspace_internet_ingestion" {
  description = "If the log analytics will support log ingestion from public IPs."
  type        = bool
  default     = false
}

variable "log_analytics_workspace_internet_query" {
  description = "If the log analytics supports querying from public IPs."
  type        = bool
  default     = false
}

variable "log_analytics_workspace_tags" {
  description = "The tags to associate with the log analytics workspace."
  type        = map(any)
  default = {
    "Managed" = "Terraform"
  }
}
