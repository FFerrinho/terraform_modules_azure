data "azurerm_virtual_network" "virtual_network" {
  name = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_key_vault" "key_vault" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  sku_name                        = var.sku_name
  tenant_id                       = var.tenant_id
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization

  network_acls {
    bypass                     = lookup(var.network_acls, "bypass", "None")
    default_action             = lookup(var.network_acls, "default_action", "Deny")
    ip_rules                   = [lookup(var.network_acls, "ip_rules", "0.0.0.0/0")]
    virtual_network_subnet_ids = [lookup(var.network_acls, "virtual_network_subnet_ids", data.azurerm_virtual_network.virtual_network.subnets[0])]
  }

  purge_protection_enabled   = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

  contact {
    email = lookup(var.contact, "email", null)
    name  = lookup(var.contact, "name", null)
    phone = lookup(var.contact, "phone", null)
  }
  tags = var.tags
}
