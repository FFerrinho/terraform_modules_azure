resource "azurerm_key_vault_key" "key" {
  name            = var.name
  key_vault_id    = var.key_vault_id
  key_type        = var.key_type
  key_size        = var.key_size
  curve           = var.curve
  key_opts        = var.key_opts
  not_before_date = var.not_before_date
  expiration_date = var.expiration_date
  tags            = var.tags

  lifecycle {
    create_before_destroy = true
  }
}
