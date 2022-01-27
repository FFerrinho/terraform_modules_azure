variable "name" {
  description = "(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
  type        = string
}

variable "value" {
  description = "(Required) Specifies the value of the Key Vault Secret."
  type        = string
}

variable "key_vault_id" {
  description = "(Required) The ID of the Key Vault where the Secret should be created."
  type        = string
}

variable "content_type" {
  description = "(Optional) Specifies the content type for the Key Vault Secret."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    "Managed" = "Terraform"
  }
}

variable "not_before_date" {
  description = "(Optional) Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')."
  type        = string
  default     = null
}

variable "expiration_date" {
  description = "(Optional) Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
  type        = string
  default     = null
}
