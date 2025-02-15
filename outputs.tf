output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.functions_rg.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.functions_rg.location
}

output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.functions_kv.id
}

output "key_vault_name" {
  description = "The name of the Key Vault"
  value       = azurerm_key_vault.functions_kv.name
}

output "virtual_network_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.subnet.id
}

output "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.example.id
}

output "app_config_id" {
  description = "The ID of the App Configuration"
  value       = azurerm_app_configuration.functions_appcfg.id
}

output "function_app_ids" {
  description = "The IDs of the Function Apps"
  value       = module.function_app.function_app_ids
}

output "function_app_names" {
  description = "The names of the Function Apps"
  value       = module.function_app.function_app_names
}