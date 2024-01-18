terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = "b7a69571-48d7-488f-94a9-a3e874cf3f2d"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}