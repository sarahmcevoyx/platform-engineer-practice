provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "functions_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_key_vault" "functions_kv" {
  name                          = var.key_vault_name
  resource_group_name           = azurerm_resource_group.functions_rg.name
  location                      = var.resource_group_location
  sku_name                      = var.key_vault_sku
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled           = var.enable_soft_delete
  purge_protection_enabled      = var.enable_purge_protection
  access_policy {
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    object_id                   = data.azurerm_client_config.current.object_id
    secret_permissions          = var.key_vault_secret_permissions
  }
  network_acls {
    default_action              = var.network_acls_default_action
    bypass                      = var.network_acls_bypass
    virtual_network_subnet_ids  = [azurerm_subnet.subnet.id]
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                  = var.vnet_name
  address_space         = var.vnet_address_space
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = var.service_endpoints
}

resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_analytics_retention_days
}

resource "azurerm_monitor_diagnostic_setting" "kv_diagnostics" {
  count                         = var.enable_key_vault_diagnostics ? 1 : 0
  name                          = "${azurerm_key_vault.functions_kv.name}${var.diagnostic_setting_name_suffix}"
  target_resource_id            = azurerm_key_vault.functions_kv.id
  log_analytics_workspace_id    = var.log_analytics_workspace_id
  log {
    category = var.log_category
    enabled  = true
    retention_policy {
      enabled = true
      days    = var.log_retention_days
    }
  }
  metric {
    category = var.metric_category
    enabled  = true
    retention_policy {
      enabled = true
      days    = var.log_retention_days
    }
  }
}

resource "azurerm_monitor_metric_alert" "kv_alert" {
  name                  = var.kv_alert_name
  resource_group_name   = var.resource_group_name
  scopes                = [azurerm_key_vault.functions_kv.id]
  description           = var.kv_alert_description
  severity              = var.kv_alert_severity
  window_size           = var.kv_alert_window_size
  evaluation_frequency  = var.kv_alert_evaluation_frequency
  criteria {
    metric_namespace    = var.kv_alert_metric_namespace
    metric_name         = var.kv_alert_metric_name
    aggregation         = var.kv_alert_aggregation
    operator            = var.kv_alert_operator
    threshold           = var.kv_alert_threshold
  }
}

resource "azurerm_app_configuration" "functions_appcfg" {
  name                  = var.app_config_name
  resource_group_name   = azurerm_resource_group.functions_rg.name
  location              = var.resource_group_location
}


module "function_app" {
  source                    = "./modules/function_app"
  functions                 = toset(var.function_app_names)
  resource_group_name       = azurerm_resource_group.functions_rg.name
  resource_group_location   = azurerm_resource_group.functions_rg.location
  app_config_uri            = var.app_config_uri
  app_config_id             = azurerm_app_configuration.functions_appcfg.id
  tenant_id                 = var.tenant_id
  key_vault_id              = azurerm_key_vault.functions_kv.id
  ap_sku_name               = var.ap_sku_name
  tags                      = var.tags
}
