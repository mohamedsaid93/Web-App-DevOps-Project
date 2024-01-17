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
  client_id       = "a3403ee4-ba8f-4a3a-896a-693eb0bd6a49"
  client_secret   = "Whz8Q~wNteq1pLhewKabcUUttuSShN9S4-Rh~aNi"
  subscription_id = "b7a69571-48d7-488f-94a9-a3e874cf3f2d"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}