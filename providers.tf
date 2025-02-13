provider "azurerm" {
  features {}
  
  # Optionally specify Azure credentials here, but it's recommended to use environment variables or the Azure CLI for security.
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}