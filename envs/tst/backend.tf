terraform {
  backend "azurerm" {
    resource_group_name   = "rg-tst"
    storage_account_name  = "tfstateaccount"
    container_name        = "terraform-states"
    key                   = "tst.terraform.tfstate"
  }
}