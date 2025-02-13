variable "function_name" {
  description = "Name of the Azure Function"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "app_service_plan_id" {
  description = "ID of the App Service Plan"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "storage_account_access_key" {
  description = "Access key for the Storage Account"
  type        = string
  sensitive   = true
}

variable "storage_account_connection_string" {
  description = "Connection string for the Storage Account"
  type        = string
  sensitive   = true
}

variable "always_on" {
  description = "Keep the function always on (Only for premium plans)"
  type        = bool
  default     = false
}