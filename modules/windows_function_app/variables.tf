variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
  default     = "uksouth"
}

variable "functions" {
  description = "A list of functions to be created"
  type        = set(string)
}

variable "function_configs" {
  description = "A map of function app configurations"
  type        = map(object({
    storage_account_name        = string
    service_plan_id             = string
    app_config_uri              = string
    https_only                  = bool
    dotnet_version              = string
    use_dotnet_isolated_runtime = bool
    scaling_settings            = map(string)
  }))
  default = {
    "products-denormalizations" = {
      storage_account_name        = "proddenormstorageacct"
      service_plan_id             = "prod-denorm-service-plan"
      app_config_uri              = "https://proddenormappconfig"
      https_only                  = true
      dotnet_version              = "8.0"
      use_dotnet_isolated_runtime = false
      scaling_settings            = { "minimum_instances" = "1", "maximum_instances" = "10" }
    }
  }
}

variable "app_config_uri" {
  description = "The URI of the App Configuration"
  type        = string
}

variable "app_config_id" {
  description = "The ID of the App Configuration"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Key Vault"
  type        = string
}

variable "ap_sku_name" {
  description = "The SKU of the App Service Plan"
  type        = string
  default     = "Y1"
}

variable "https_only" {
  description = ""
  default = true
}

variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
  default     = "LRS"
}

variable "storage_account_name_prefix" {
  description = "The prefix for the storage account name"
  type        = string
  default     = "funcstorage"
}

variable "allow_nested_items_to_be_public" {
  description = "Whether to allow nested items to be public"
  type        = bool
  default     = false
}

variable "min_tls_version" {
  description = "The minimum TLS version to be used"
  type        = string
  default     = "TLS1_2"
}

variable "cross_tenant_replication_enabled" {
  description = "Whether cross-tenant replication is enabled"
  type        = bool
  default     = true
}

variable "last_access_time_enabled" {
  description = "Whether to enable last access time tracking"
  type        = bool
  default     = true
}

variable "delete_retention_days" {
  description = "Number of days to retain deleted items"
  type        = number
  default     = 5
}

variable "container_delete_retention_days" {
  description = "Number of days to retain deleted containers"
  type        = number
  default     = 5
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "service_plan_name_prefix" {
  description = "The prefix for the service plan name"
  type        = string
  default     = "planmyfunc"
}

variable "os_type" {
  description = "The OS type for the service plan"
  type        = string
  default     = "Windows"
}

variable "ignore_changes" {
  description = "List of lifecycle attributes to ignore changes for"
  type        = list(string)
  default     = ["maximum_elastic_worker_count"]
}

variable "website_run_from_package" {
  description = "Whether to enable WEBSITE_RUN_FROM_PACKAGE"
  type        = string
  default     = "1"
}

variable "ftps_state" {
  description = "FTPS state"
  type        = string
  default     = "Disabled"
}

variable "app_scale_limit" {
  description = "Application scale limit"
  type        = number
  default     = 2
}

variable "use_32_bit_worker" {
  description = "Whether to use a 32-bit worker"
  type        = bool
  default     = false
}

variable "dotnet_version" {
  description = "The .NET version to be used"
  type        = string
  default     = "v8.0"
}

variable "use_dotnet_isolated_runtime" {
  description = "Whether to use the .NET isolated runtime"
  type        = bool
  default     = true
}

variable "identity_type" {
  description = "The type of identity to assign to the Function App"
  type        = string
  default     = "SystemAssigned"
}

variable "secret_permissions" {
  description = "The list of secret permissions"
  type        = list(string)
  default     = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}

variable "client_certificate_mode" {
  description = "The client certificate mode for the Function App"
  type        = string
  default     = "Required"
}

variable "always_on" {
  description = "Specifies whether the Function App is always on"
  type        = bool
  default     = true
}

variable "minimum_instances" {
  description = "The minimum number of instances for the Function App"
  type        = number
  default     = 1
}

variable "maximum_instances" {
  description = "The maximum number of instances for the Function App"
  type        = number
  default     = 10
}