terraform {
  backend "azurerm" {
    resource_group_name   = "rg-prd"
    storage_account_name  = "tfstateaccount"
    container_name        = "terraform-states"
    key                   = "prd.terraform.tfstate"
  }
}