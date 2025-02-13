resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                 = var.location
  account_tier               = "Standard" # Choose the tier you need (e.g., "Premium")
  account_replication_type = "LRS"      # Local Redundant Storage

  tags = var.tags
}

output "storage_account_connection_string" {
  value = azurerm_storage_account.this.primary_connection_string
}