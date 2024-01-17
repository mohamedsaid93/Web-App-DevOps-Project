variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}


variable "cluster_location" {
  description = "The Azure region where the AKS cluster will be deployed to."
  type        = string
}


variable "dns_prefix" {
  description = "The DNS prefix of cluster."
  type        = string
}


variable "kubernetes_version" {
  description = "The Kubernetes version the cluster will use."
  type        = string
}


variable "service_principal_client_id" {
  description = "The Client ID for the service principal associated with the cluster."
  type        = string
}


variable "service_principal_client_secret" {
  description = "The Client Secret for the service principal associated with the cluster."
  type        = string
}


variable "resource_group_name" {
  description = "Name of the Azure Resource Group for networking resources."
  type        = string
  #default = module.networking.networking_resource_group_name
}


variable "vnet_id" {
  description = "ID of the Virtual Network (VNet)."
  type        = string
  #default = module.networking.vnet_id
}


variable "control_plane_subnet_id" {
  description = "ID of the control plane subnet."
  type        = string
  #default = module.networking.control_plane_subnet_id
}


variable "worker_node_subnet_id" {
  description = "ID of the worker node subnet."
  type        = string
  #default = module.networking.worker_node_subnet_id
}


variable "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG) for AKS."
  type        = string
  #default = module.networking.aks_nsg_id
}

