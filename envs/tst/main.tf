provider "azurerm" {
  features {}
}

# Module to create the Key Vault
module "key_vault" {
  source                     = "../../modules/key_vault"
  key_vault_name             = "tst-keyvault"
  location                   = "East US"
  resource_group_name        = var.resource_group_name
  tenant_id                  = var.tenant_id
  object_id                  = var.object_id
  storage_account_connection_string = var.storage_account_connection_string
  function_app_secret_key    = var.function_app_secret_key
}

# Module to create the Storage Account
module "storage_account" {
  source                   = "../../modules/storage_account"
  storage_account_name     = "tststoracc"
  resource_group_name      = var.resource_group_name
  location                 = "East US"
  tags                     = var.tags
}

# Module to create the Function App
module "function_app" {
  source                      = "../../modules/function_app"
  function_name               = "my-function-app-tst"
  location                    = "East US"
  resource_group_name         = var.resource_group_name
  app_service_plan_id         = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Web/serverfarms/${var.app_service_plan_id}"
  storage_account_name        = module.storage_account.storage_account_name
  storage_account_connection_string = module.key_vault.storage_connection_string_secret_id
  always_on                   = true
}

output "function_app_name" {
  value = module.function_app.function_app_name
}