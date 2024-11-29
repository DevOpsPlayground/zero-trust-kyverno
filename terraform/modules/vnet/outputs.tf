output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}
output "resource_group_names" {
  value = azurerm_resource_group.aks.name
}

output "resource_group_location" {
  value = azurerm_resource_group.aks.location
}

output "resource_group_id" {
  value = azurerm_resource_group.aks.id
}
