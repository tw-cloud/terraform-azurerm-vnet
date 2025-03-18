resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = local.tags
}

module "subnet" {
  source   = "./modules/subnet"
  for_each = var.subnets

  name                = each.key
  resource_group_name = var.resource_group_name

  vnet_name         = azurerm_virtual_network.vnet.name
  address_prefixes  = each.value.address_prefixes
  service_endpoints = each.value.service_endpoints
  delegation        = each.value.delegation
}
