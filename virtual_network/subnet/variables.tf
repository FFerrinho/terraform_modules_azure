variable "name" {
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "virtual_network_name" {
  description = "(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "address_prefixes" {
  description = "(Optional) The address prefixes to use for the subnet."
  type        = list(string)
  default     = null
}

variable "delegation" {
  description = "(Optional) One or more delegation blocks as defined in https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#argument-reference."
  type        = map(any)
  default     = null
}

variable "enforce_private_link_endpoint_network_policies" {
  description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false."
  type        = bool
  default     = false
}

variable "enforce_private_link_service_network_policies" {
  description = "(Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. Default value is false."
  type        = bool
  default     = false
}

variable "service_endpoints" {
  description = "(Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web."
  type        = list(string)
  default     = null
}

variable "service_endpoint_policy_ids" {
  description = "(Optional) The list of IDs of Service Endpoint Policies to associate with the subnet."
  type        = list(string)
  default     = null
}
