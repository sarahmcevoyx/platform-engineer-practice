resource "azurerm_function_app" "this" {
  name                     = var.function_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  app_service_plan_id      = var.app_service_plan_id
  storage_account_name     = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  version                  = "~4" # Function runtime version
  
  identity {
    type = "SystemAssigned" # Managed identity for secure access
  }

  site_config {
    application_stack {
      dotnet_version = "6.0" # You can change to the runtime you prefer (e.g., Python, Node)
    }
    always_on = var.always_on # Keep the function always on (only for premium plans)
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "dotnet"
    "AzureWebJobsStorage"      = var.storage_account_connection_string
  }
}