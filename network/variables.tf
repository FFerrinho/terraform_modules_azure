variable "vnet_name" {
  description = "The name for the Virtual Network"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name where this resource will be created."
  type        = string
}

variable "vnet_address_space" {
  description = "The CIDR(s) to use for the Azure virtual network."
  type        = set(string)
  default     = ["10.0.0.0/16"]
}

variable "location" {
  description = "The location to use for the Azure resources."
  type        = string
  default     = "germanywestcentral"
}

variable "dns_server" {
  description = "The DNS server(s) to use for the Azure virtual network."
  type        = set(string)
  default     = null
}

variable "tags" {
  description = "The tags to attach to the resource. There are default values, and per module you should be able to pass additional tags."
  type        = map(string)
  default = {
    "environment" = "production"
    "provisioner" = "terraform"
  }
}

### Private DNS zone

variable "pdns_name" {
  description = "The name for the Private DNS zone."
  type        = string
}

variable "soa_record" {
  description = "The SOA record for the Private DNS zone."
  type = map(object({
    host    = string
    email   = string
    serial  = number
    refresh = number
    retry   = number
    expire  = number
    minimum = number
  }))
  default = null
}

variable "registration_enabled" {
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?"
  type        = bool
  default     = false
}
