variable "name" {
  description = "The name for the resource group."
  type        = string
}

variable "location" {
  description = "The location for the resource group."
  type        = string
  default     = "germanywestcentral"
}

variable "tags" {
  description = "The tags to assign to the resource group."
  type        = map(string)
  default = {
    Managed = Terraform
  }
}
