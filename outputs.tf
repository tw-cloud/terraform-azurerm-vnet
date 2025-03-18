output "id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the virtual network."
}

output "name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the virtual network."
}

output "address_space" {
  value       = azurerm_virtual_network.vnet.address_space
  description = "The address space that is used by the virtual network."
}

output "subnets" {
  value = {
    for subnet in module.subnet :
    subnet.name => {
      id               = subnet.id
      address_prefixes = subnet.address_prefixes
      delegation       = subnet.delegation
    }
  }
}

output "resource_group_name" {
  value       = azurerm_virtual_network.vnet.resource_group_name
  description = "The name of the resource group in which the virtual network was created."
}

output "location" {
  value       = azurerm_virtual_network.vnet.location
  description = "The Azure region in which the virtual network was created."
}