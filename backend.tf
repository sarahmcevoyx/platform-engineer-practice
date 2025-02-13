terraform {
  backend "azurerm" {
    resource_group_name   = "rg-terraform"
    storage_account_name  = "tfstateaccount"
    container_name        = "terraform-states"
    key                   = "terraform.tfstate"
  }
}