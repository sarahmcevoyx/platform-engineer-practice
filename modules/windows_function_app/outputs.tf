output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.functions_rg.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.functions_rg.location
}

output "function_app_ids" {
  description = "The IDs of the Function Apps"
  value       = { for k, v in azurerm_windows_function_app.new : k => v.id }
}

output "function_app_names" {
  description = "The names of the Function Apps"
  value       = { for k, v in azurerm_windows_function_app.new : k => v.name }
}

output "function_app_principal_ids" {
  description = "The principal IDs of the Function Apps"
  value       = { for k, v in azurerm_windows_function_app.new : k => v.identity[0].principal_id }
}

output "app_config_data_reader_func_role_assignment_ids" {
  description = "The IDs of the App Configuration Data Reader role assignments"
  value       = { for k, v in azurerm_role_assignment.app_config_data_reader_func : k => v.id }
}

output "key_vault_access_policy_ids" {
  description = "The IDs of the Key Vault access policies"
  value       = { for k, v in azurerm_key_vault_access_policy.function : k => v.id }
}

output "service_plan_ids" {
  description = "The IDs of the Service Plans"
  value       = { for k, v in azurerm_service_plan.func_service_plan : k => v.id }
}

output "service_plan_names" {
  description = "The names of the Service Plans"
  value       = { for k, v in azurerm_service_plan.func_service_plan : k => v.name }
}

output "storage_account_names" {
  description = "The names of the Storage Accounts"
  value       = { for k, v in azurerm_storage_account.func_storage : k => v.name }
}

output "storage_account_ids" {
  description = "The IDs of the Storage Accounts"
  value       = { for k, v in azurerm_storage_account.func_storage : k => v.id }
}