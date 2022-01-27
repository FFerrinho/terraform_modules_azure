variable "name" {
  description = "The name for the subnet."
  type        = string
}

variable "address_prefixes" {
  description = "The CIDR block to use with the subnet."
  type        = list(any)
}

variable "virtual_network_name" {
  description = "The name for the virtual network, where the subnet will be hosted."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group for the virtual network where the subnet will be hosted."
  type        = string
}
