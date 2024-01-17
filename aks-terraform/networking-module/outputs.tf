
# Define the output of the virtual network ID.
output "vnet_id" {
  description = "ID of the Virtual Network (VNet)."
  value       = azurerm_virtual_network.aks_vnet.id
}


# Define the output of the control plane subnet ID.
output "control_plane_subnet_id" {
  description = "ID of the control plane subnet."
  value       = azurerm_subnet.control_plane_subnet.id
}


# Define the output of the worker node subnet ID.
output "worker_node_subnet_id" {
  description = "ID of the worker node subnet."
  value       = azurerm_subnet.worker_node_subnet.id
}


# Define the output of the networking resource group name ID.
output "networking_resource_group_name" {
  description = "Name of the Azure Resource Group for networking resources."
  value       = azurerm_resource_group.networking.name
}

# Define the output of the networking resource group.
output "networking_resource_group" {
  description = "Name of the Azure Resource Group for networking resources."
  value       = azurerm_resource_group.networking
}


# Define the output of the network security group ID.
output "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG) for AKS."
  value       = azurerm_network_security_group.aks_nsg.id
}




