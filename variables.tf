variable function_app_names {
    description = ""
    type = list(string)
    default = [
      "pricing",
      "products",
      "rebates"
    ]
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
  default     = "uksouth"
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "key_vault_sku" {
  description = "The SKU of the Key Vault"
  type        = string
}

variable "key_vault_secret_permissions" {
  description = "The list of secret permissions for the Key Vault"
  type        = list(string)
  default     = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}

variable "app_config_name" {
  description = "The name of the App Configuration"
  type        = string
}

variable "function_app_names" {
  description = "A list of function app names"
  type        = list(string)
}

variable "service_plan_name_prefix" {
  description = "The prefix for the service plan name"
  type        = string
  default     = "planmyfunc"
}

variable "storage_account_name_prefix" {
  description = "The prefix for the storage account name"
  type        = string
  default     = "funcstorage"
}

variable "function_app_name_prefix" {
  description = "The prefix for the function app name"
  type        = string
  default     = "myfunc"
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

variable "ap_sku_name" {
  description = "The SKU of the App Service Plan"
  type        = string
  default     = "Y1"
}

variable "https_only" {
  description = "Whether the function app should enforce HTTPS only"
  type        = bool
  default     = true
}

variable "client_certificate_mode" {
  description = "The client certificate mode"
  type        = string
  default     = "Required"
}

variable "functions_extension_version" {
  description = "The version of the Functions extension"
  type        = string
  default     = "~4"
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

variable "website_run_from_package" {
  description = "Whether to enable WEBSITE_RUN_FROM_PACKAGE"
  type        = string
  default     = "1"
}

variable "identity_type" {
  description = "The type of identity to assign to the Function App"
  type        = string
  default     = "SystemAssigned"
}

variable "app_config_uri" {
  description = "The URI of the App Configuration"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "tenant_id" {
  description = "The tenant ID"
  type        = string
}

variable "ignore_changes" {
  description = "List of lifecycle attributes to ignore changes for"
  type        = list(string)
  default     = ["maximum_elastic_worker_count"]
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

variable "enable_purge_protection" {
  description = "Enable Purge Protection for Key Vault"
  type        = bool
  default     = true
}

variable "enable_soft_delete" {
  description = "Enable Soft Delete for Key Vault"
  type        = bool
  default     = true
}

variable "diagnostic_setting_name_suffix" {
  description = "Suffix for the diagnostic setting name"
  type        = string
  default     = "-diag"
}

variable "log_retention_days" {
  description = "Retention period for logs and metrics in days"
  type        = number
  default     = 30
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace"
  type        = string
}

variable "enable_key_vault_diagnostics" {
  description = "Enable diagnostic settings for Key Vault"
  type        = bool
  default     = true
}

variable "log_category" {
  description = "Category for logs"
  type        = string
  default     = "AuditEvent"
}

variable "metric_category" {
  description = "Category for metrics"
  type        = string
  default     = "AllMetrics"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "example-vnet"
}

variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "example-subnet"
}

variable "subnet_address_prefixes" {
  description = "The address prefixes of the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "service_endpoints" {
  description = "The service endpoints to associate with the subnet"
  type        = list(string)
  default     = ["Microsoft.KeyVault"]
}

variable "network_acls_default_action" {
  description = "The default action for the network ACLs"
  type        = string
  default     = "Deny"
}

variable "network_acls_bypass" {
  description = "The bypass setting for the network ACLs"
  type        = string
  default     = "AzureServices"
}

variable "kv_alert_name" {
  description = "The name of the Key Vault alert"
  type        = string
  default     = "kv-alert"
}

variable "kv_alert_description" {
  description = "The description of the Key Vault alert"
  type        = string
  default     = "Alert for Key Vault activity"
}

variable "kv_alert_severity" {
  description = "The severity level of the Key Vault alert"
  type        = number
  default     = 2
}

variable "kv_alert_window_size" {
  description = "The window size for the Key Vault alert"
  type        = string
  default     = "PT5M"
}

variable "kv_alert_evaluation_frequency" {
  description = "The evaluation frequency for the Key Vault alert"
  type        = string
  default     = "PT1M"
}

variable "kv_alert_metric_namespace" {
  description = "The metric namespace for the Key Vault alert"
  type        = string
  default     = "Microsoft.KeyVault/vaults"
}

variable "kv_alert_metric_name" {
  description = "The metric name for the Key Vault alert"
  type        = string
  default     = "AuditEvent"
}

variable "kv_alert_aggregation" {
  description = "The aggregation type for the Key Vault alert"
  type        = string
  default     = "Total"
}

variable "kv_alert_operator" {
  description = "The operator for the Key Vault alert"
  type        = string
  default     = "GreaterThan"
}

variable "kv_alert_threshold" {
  description = "The threshold for the Key Vault alert"
  type        = number
  default     = 0
}

variable "log_analytics_workspace_sku" {
  description = "The SKU for the Log Analytics Workspace"
  type        = string
  default     = "PerGB2018"
}