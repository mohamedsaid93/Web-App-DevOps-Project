
# Create the Azure Resource Group for networking resources.
resource "azurerm_resource_group" "networking" {
  name     = var.resource_group_name
  location = var.location
}


# Define the Virtual Network (VNet) for the AKS cluster.
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks_vnet"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
  depends_on = [azurerm_resource_group.networking]
}


# Define first subnet within the VNet for control plane.
resource "azurerm_subnet" "control_plane_subnet" {
  name                 = "control_plane_subnet"
  resource_group_name  = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [azurerm_resource_group.networking, azurerm_virtual_network.aks_vnet]
}


# Define second subnet within the VNet for worker nodes.
resource "azurerm_subnet" "worker_node_subnet" {
  name                 = "worker_node_subnet"
  resource_group_name  = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
  depends_on = [azurerm_resource_group.networking, azurerm_virtual_network.aks_vnet]
}


# Define Network Security Group (NSG) for the AKS subnet
resource "azurerm_network_security_group" "aks_nsg" {
  name                = "aks_nsg"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
  depends_on = [azurerm_resource_group.networking]
}


# Allow inbound traffic to kube-apiserver (TCP/443) from my public IP address.
resource "azurerm_network_security_rule" "kube_apiserver-rule" {
  name                        = "kube_apiserver-rule"
  resource_group_name         = azurerm_resource_group.networking.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.my_ip_address 
  destination_address_prefix  = "*"
  depends_on = [azurerm_resource_group.networking, azurerm_network_security_group.aks_nsg]
}


# Allow inbound traffic for SSH (TCP/22) from my public IP address.
resource "azurerm_network_security_rule" "ssh-rule" {
  name                        = "ssh-rule"
  resource_group_name         = azurerm_resource_group.networking.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.my_ip_address
  destination_address_prefix  = "*"
  depends_on = [azurerm_resource_group.networking, azurerm_network_security_group.aks_nsg]
}

