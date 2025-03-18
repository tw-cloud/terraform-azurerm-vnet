data "azurerm_virtual_network" "source_network" {
  name                = var.source_network.virtual_network_name
  resource_group_name = var.source_network.resource_group_name
}

data "azurerm_virtual_network" "target_network" {
  name                = var.target_network.virtual_network_name
  resource_group_name = var.target_network.resource_group_name
}

resource "azurerm_virtual_network_peering" "peer_source_to_target" {
  name                         = "${var.source_network.virtual_network_name}-to-${var.target_network.virtual_network_name}"
  resource_group_name          = var.source_network.resource_group_name
  virtual_network_name         = data.azurerm_virtual_network.source_network.name
  remote_virtual_network_id    = data.azurerm_virtual_network.target_network.id
  allow_virtual_network_access = var.source_network.allow_virtual_network_access
  allow_forwarded_traffic      = var.source_network.allow_forwarded_traffic
  allow_gateway_transit        = var.source_network.allow_gateway_transit
  use_remote_gateways          = var.source_network.use_remote_gateways
}

resource "azurerm_virtual_network_peering" "peer_target_to_source" {
    count = var.target_network.peer_back ? 1 : 0

    name                         = "${var.target_network.virtual_network_name}-to-${var.source_network.virtual_network_name}"
    resource_group_name          = var.target_network.resource_group_name
    virtual_network_name         = data.azurerm_virtual_network.target_network.name
    remote_virtual_network_id    = data.azurerm_virtual_network.source_network.id
    allow_virtual_network_access = var.target_network.allow_virtual_network_access
    allow_forwarded_traffic      = var.target_network.allow_forwarded_traffic
    allow_gateway_transit        = var.target_network.allow_gateway_transit
    use_remote_gateways          = var.target_network.use_remote_gateways
}