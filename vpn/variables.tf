variable "name" {
  description = "The name (suffix) to use when composing the resource names."
  type        = string
}

variable "resource_group_name" {
  description = "The name os the resource group that will be used to deploy the resources in."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network that wil host the subnet."
  type        = string
}

variable "gateway_cidr" {
  description = "The CIDR blocks to use with the subnet."
  type        = set(string)
}

variable "location" {
  description = "The location for the resources."
  type        = string
}

variable "pip_sku" {
  description = "The SKU for the Public IP."
  type        = string
  default     = "Standard"
}

variable "allocation_method" {
  description = "The allocation method for the public IP. Can be \"Static\" or \"Dynamic\""
  type        = string
  default     = "Static"
}

variable "availability_zone" {
  description = "The availability zone for the Public IP."
  type        = any
  default     = "Zone-Redundant"
  validation {
    condition     = var.availability_zone == 1 || var.availability_zone == 2 || var.availability_zone == 3 || var.availability_zone == "Zone-Redundant" || var.availability_zone == "No-Zone"
    error_message = "Accepted values are 1, 2, 3, Zone-Redundant or No-Zone."
  }
}

variable "vpn_type" {
  description = "The VPN type. Can be \"RouteBased\" or \"PolicyBased\""
  type        = string
  default     = "RouteBased"
}

variable "sku" {
  description = "The SKU for the Virtual Network Gateway."
  type        = string
  default     = "VpnGw2AZ"
}

variable "generation" {
  description = "The generation of the Virtual Network Gateway."
  type        = string
  default     = "Generation2"
}

variable "vpn_cidr" {
  description = "The IP(s) or CIDR(s) for the VPN Point-to-Site configuration."
  type        = set(string)
}

/* variable "aad_tenant" {
  description = "The AzureAD tenant URL."
  type        = string
}

variable "aad_audience" {
  description = "The client ID of the Azure VPN application."
  type        = string
  default     = "41b23e61-6c1e-4545-b367-cd054e0ed4b4"
}

variable "aad_issuer" {
  description = "The STS url for the AzureAD tenant."
  type        = string
} */

variable "root_certificate_name" {
  description = "The name for the root certificate to associate with the VPN."
  type        = string
}

variable "public_cert_data" {
  description = "The public certificate data to associate with the VPN."
  type        = string
}

variable "vpn_client_protocols" {
  description = "The protocols to use with the VPN. Note that SSTP and IkeV2 are incompatible with AzureAD authentication."
  type        = set(string)
  default     = ["OpenVPN"]
}

variable "vpn_auth_types" {
  description = "A list of vpn authentication methods for the gateway."
  type        = set(string)
  default     = ["AAD"]
}

variable "tags" {
  description = "The tags to apply to the resource."
  type        = map(any)
}

variable "firewall_cidr" {
  description = "The CIDR for the Firewall subnet. This should be a /26 notation."
  type        = set(string)
}

variable "peered_vnets" {
  description = "The name and resource group for the Virtual Networks to peer with the VPN."
  type = list(object({
    rg_name   = string
    vnet_name = string
  }))
}

variable "private_dns_zones" {
  description = "The name and resource group of the Private DNS Zones to which the VPN needs name resolution."
  type = list(object({
    rg_name   = string
    pdns_name = string
  }))
}
