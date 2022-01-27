variable "name" {
  description = "The name for the virtual network."
  type        = string
}

variable "location" {
  description = "The location for the virtual network."
  type        = string
  default = "germanywestcentral"
}

variable "resource_group" {
  description = "The resource group where the virtual network will be created."
  type        = string
}

variable "address_space" {
  description = "The CIDR for the virtual network."
  type        = list(string)
}

variable "dns_servers" {
  description = "The DNS servers to use with the virtual network."
  type        = list(string)
}

variable "tags" {
  description = "The tags to associate with the virtual network."
  type        = map(any)
  default = {
    "Managed" = "Terraform"
  }
}
