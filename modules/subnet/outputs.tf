output "id" {
  value     = azurerm_subnet.subnet.id
  description = "The ID of the subnet."
}

output "name" {
  value     = azurerm_subnet.subnet.name
  description = "The name of the subnet."
}

output "address_prefixes" {
  value     = azurerm_subnet.subnet.address_prefixes
  description = "The address prefixes that are used for the subnet."
}

output "delegation" {
  value     = azurerm_subnet.subnet.delegation
  description = "The delegation information for the subnet."
}