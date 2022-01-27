variable "name" {
  description = "(Required) Specifies the name of the Key Vault Key. Changing this forces a new resource to be created."
  type        = string
}

variable "key_vault_id" {
  description = "(Required) The ID of the Key Vault where the Key should be created. Changing this forces a new resource to be created."
  type        = string
}

variable "key_type" {
  description = "(Required) Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), EC-HSM, Oct (Octet), RSA and RSA-HSM. Changing this forces a new resource to be created."
  type        = string
}

variable "key_size" {
  description = "(Optional) Specifies the Size of the RSA key to create in bytes. For example, 1024 or 2048. Note: This field is required if key_type is RSA or RSA-HSM. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "curve" {
  description = "(Optional) Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key_type is EC or EC-HSM. The API will default to P-256 if nothing is specified. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "key_opts" {
  description = "(Required) A list of JSON web key operations. Possible values include: decrypt, encrypt, sign, unwrapKey, verify and wrapKey. Please note these values are case sensitive."
  type        = list(string)
  default     = ["verify"]
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

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    "Managed" = "Terraform"
  }
}
