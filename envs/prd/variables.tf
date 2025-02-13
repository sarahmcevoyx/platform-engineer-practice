variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
  default     = "rg-prd"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "object_id" {
  description = "Azure Object ID (User/Managed Identity)"
  type        = string
}

variable "storage_account_connection_string" {
  description = "The connection string for the Storage Account"
  type        = string
  sensitive   = true
}

variable "function_app_secret_key" {
  description = "The secret key for the Function App"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan"
  type        = string
}