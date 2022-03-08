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

variable "address_prefixes" {
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
  type        = number
  default     = 1
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

variable "address_space" {
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
}

variable "tags" {
  description = "The tags to apply to the resource."
  type        = map(any)
}
