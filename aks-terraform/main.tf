
module "networking" {
  source = "./networking-module"

  # Input variables for the networking module
  resource_group_name = "networking-resource-group"
  location            = "UK South"
  vnet_address_space  = ["10.0.0.0/16"]
}


module "aks_cluster" {
  source = "./aks-cluster-module"

  # Input variables for the AKS cluster module
  aks_cluster_name                = "terraform-aks-cluster"
  cluster_location                = "UK South"
  dns_prefix                      = "myaks-project"
  kubernetes_version              = "1.26.6"
  service_principal_client_id     = var.your-service-principal-client-id  
  service_principal_client_secret = var.your-service-principal-client-secret

  # Input variables referencing outputs from the networking module
  resource_group_name             = module.networking.networking_resource_group_name
  vnet_id                         = module.networking.vnet_id
  control_plane_subnet_id         = module.networking.control_plane_subnet_id
  worker_node_subnet_id           = module.networking.worker_node_subnet_id
  aks_nsg_id                      = module.networking.aks_nsg_id
} 