resource "azurerm_log_analytics_workspace" "aks" {
  name                       = var.log_analytics_workspace_name
  location                   = var.aks_location
  resource_group_name        = var.aks_resource_group
  retention_in_days          = var.log_analytics_workspace_retention
  sku                        = var.log_analytics_workspace_sku
  internet_ingestion_enabled = var.log_analytics_workspace_internet_ingestion
  internet_query_enabled     = var.log_analytics_workspace_internet_query
  tags                       = var.log_analytics_workspace_tags
}
