resource "aurerm_subnet" "psql_flex" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes

  delegation {
    name = var.subnet_delegation
    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/actionF"]
    }
  }

  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
  service_endpoints                              = var.service_endpoints
  service_endpoints_policy_ids                   = var.service_endpoints_policy_ids
}
