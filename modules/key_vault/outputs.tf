output "key_vault_id" {
  value       = azurerm_key_vault.this.id
  description = "The ID of the Key Vault"
}

output "storage_connection_string_secret_id" {
  value       = azurerm_key_vault_secret.storage_connection_string.id
  description = "The ID of the secret storing the storage account connection string"
}