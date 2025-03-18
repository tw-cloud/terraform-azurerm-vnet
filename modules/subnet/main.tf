resource "azurerm_subnet" "subnet" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes

  service_endpoints = var.service_endpoints

  dynamic "delegation" {
    for_each = var.delegation
    content {
      name = delegation.value.name
      dynamic "service_delegation" {
        for_each = delegation.value.service_delegation
        content {
          name    = service_delegation.value.name
          actions = service_delegation.value.actions
        }
      }
    }
  }

  lifecycle {
    ignore_changes = [
      address_prefixes,
      delegation
    ]
  }
}
