resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name

  default_node_pool {
    name                 = "default"
    vm_size              = var.vm_size
    availability_zones   = var.availability_zones
    enable_auto_scaling  = var.enable_auto_scaling
    max_count            = var.max_count
    min_count            = var.min_count
    node_count           = var.node_count
    orchestrator_version = var.orchestrator_version
    os_disk_type         = var.os_disk_type
    type                 = var.type
    tags                 = var.tags
    vnet_subnet_id       = azurerm_subnet.aks_subnet.id
  }

  automatic_channel_upgrade = var.automatic_channel_upgrade

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.log_workspace.id
    }
  }

  depends_on = [
    azurerm_subnet
  ]
}
