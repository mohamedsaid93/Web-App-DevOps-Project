variable "resource_group_name" {
  description = "The name of the Azure resource group where the Storage Account will be created."
  type        = string
  #default     = "networking-resource-group"
}

variable "location" {
  description = "The Azure region where the Storage Account will be deployed."
  type        = string
  #default     = "UK South"
  
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network (VNet)."
  type        = list(string)
  #default     = ["10.0.0.0/16"]
}


variable "my_ip_address" {
  description = "The IP address for the source_address_prefix of the network security rule "
  type        = string
  default     = "86.176.161.33"
}