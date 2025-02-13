output "function_app_name" {
  value       = azurerm_function_app.this.name
  description = "The name of the deployed Azure Function App"
}

output "function_app_id" {
  value       = azurerm_function_app.this.id
  description = "The ID of the Azure Function App"
}