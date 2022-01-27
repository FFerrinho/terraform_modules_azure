variable "key_vault_id" {
  description = "(Required) Specifies the id of the Key Vault resource. Changing this forces a new resource to be created."
  type        = string
}

variable "tenant_id" {
  description = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Changing this forces a new resource to be created."
  type        = string
}

variable "object_id" {
  description = "(Required) The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
  type        = string
}

variable "application_id" {
  description = "(Optional) The object ID of an Application in Azure Active Directory."
  type        = string
  default     = null
}

variable "certificate_permissions" {
  description = "(Optional) List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
  type        = list(string)
  default     = null
}

variable "key_permissions" {
  description = "(Optional) List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey."
  type        = list(string)
  default     = null
}

variable "secret_permissions" {
  description = "(Optional) List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
  type        = list(string)
  default     = null
}

variable "storage_permissions" {
  description = "(Optional) List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update."
  type        = list(string)
  default     = null
}
