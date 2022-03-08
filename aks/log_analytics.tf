resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = var.log_workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
  daily_quota_gb      = var.daily_quota_gb
}
