# terraform/modules/networking/outputs.tf

output "resource_group_name" { value = azurerm_resource_group.main.name }
output "vnet_id"             { value = azurerm_virtual_network.main.id }
output "vnet_name"           { value = azurerm_virtual_network.main.name }

output "subnet_ids" {
  value = {
    gateway           = azurerm_subnet.gateway.id
    aks_nodes         = azurerm_subnet.aks_nodes.id
    private_endpoints = azurerm_subnet.private_endpoints.id
    bastion           = azurerm_subnet.bastion.id
  }
}

output "private_dns_zone_ids" {
  value = { for k, v in azurerm_private_dns_zone.zones : k => v.id }
}