resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.aks_location
  resource_group_name = var.aks_resource_group

  default_node_pool {
    name                  = var.aks_node_pool_name
    node_count            = var.aks_node_pool_count
    vm_size               = var.aks_node_pool_vm_size
    availability_zones    = var.aks_node_pool_availability_zones
    enable_auto_scaling   = var.aks_node_pool_auto_scaling
    max_count             = var.aks_node_pool_max_count
    min_count             = var.aks_node_pool_min_count
    enable_node_public_ip = var.aks_node_pool_public_ip
    node_labels           = var.aks_node_pool_labels
    orchestrator_version  = var.aks_version
    os_sku                = var.aks_node_pool_os_sku
    type                  = var.aks_node_pool_type
    tags                  = var.aks_tags
  }

  dns_prefix                = var.aks_dns_prefix
  automatic_channel_upgrade = var.aks_automatic_upgrade

  addon_profile {
    oms_agent {
      enabled                    = var.aks_oms_agent_enabled
      log_analytics_workspace_id = var.aks_oms_agent_log_analytics_workspace_id
    }
    ingress_application_gateway {
      enabled    = var.aks_ingress_application_gateway_enabled
      gateway_id = var.aks_ingress_application_gateway_id
    }
  }

  auto_scaler_profile {
    expander                     = var.aks_auto_scaler_profile_expander
    max_graceful_termination_sec = var.aks_auto_scaler_profile_graceful_termination
    max_node_provisioning_time   = var.aks_auto_scaler_profile_max_provisioning_time
    max_unready_percentage       = var.aks_auto_scaler_profile_unready_percentage
  }

  identity {
    type = var.aks_identity
  }

  kubernetes_version     = var.aks_version
  local_account_disabled = var.aks_local_account_disabled

  maintenance_window {
    allowed {
      day   = var.aks_maintenance_window_allowed_day
      hours = var.aks_maintenance_window_allowed_hours
    }
  }

  network_profile {
    network_plugin = var.aks_network_profile_plugin
    dns_service_ip = var.aks_network_profile_dns_service_ip
    outbound_type  = var.aks_network_profile_outbound_type
    service_cidr   = var.aks_network_profile_service_cidr
  }

  node_resource_group = var.aks_node_resource_group

  public_network_access_enabled = var.aks_public_network_access

  role_based_access_control {
    enabled = var.aks_role_based_access_control_enabled
  }

  tags = var.aks_tags
}
