resource "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  enabled_for_deployment = true
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true

  sku_name = "standard"  # or "premium" based on your needs

  access_policies {
    tenant_id = var.tenant_id
    object_id = var.object_id  # Can be the managed identity or user
    permissions {
      secrets = ["get", "list"]
    }
  }
}

resource "azurerm_key_vault_secret" "storage_connection_string" {
  name         = "StorageAccountConnectionString"
  value        = var.storage_account_connection_string
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "function_app_key" {
  name         = "FunctionAppSecretKey"
  value        = var.function_app_secret_key
  key_vault_id = azurerm_key_vault.this.id
}