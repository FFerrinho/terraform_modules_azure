variable "name" {
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
}


variable "resource_group" {
  description = "(Required) The name of the resource group in which to create the virtual network."
  type        = string
}

variable "address_space" {
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space."
  type        = list(string)
}

variable "location" {
  description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created."
  type        = string
}

variable "bgp_community" {
  description = "(Optional) The BGP community attribute in format <as-number>:<community-value>."
  type        = string
  default     = null
}

variable "ddos_protection_plan" {
  description = "(Optional) A ddos_protection_plan block as documented in https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network#argument-reference."
  type        = map(string)
  default     = null
}

variable "dns_servers" {
  description = "(Optional) List of IP addresses of DNS servers"
  type        = list(string)
  default     = null
}

variable "flow_timeout_in_minutes" {
  description = "(Optional) The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes."
  type        = number
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    Managed = "Terraform"
  }
}
