variable "resource_group_name" {
  description = "The name for the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location for the resource group."
  type        = string
  default     = "germanywestcentral"
}

variable "resource_group_tags" {
  description = "The tags to assign to the resource group."
  type        = map(any)
}
