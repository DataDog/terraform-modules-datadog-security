
# Allow logs to be written to the event hub
resource "azurerm_eventhub_namespace_authorization_rule" "azure-ad" {
  count               = var.azure-ad-logs.enabled ? 1 : 0
  namespace_name      = azurerm_eventhub_namespace.this.name
  name                = azurerm_eventhub.this.name
  resource_group_name = var.resource-group-name

  send   = true
  listen = false
  manage = false
}

resource "azurerm_monitor_aad_diagnostic_setting" "this" {
  count                          = var.azure-ad-logs.enabled ? 1 : 0
  name                           = var.azure-ad-logs.diagnostic-setting-name
  eventhub_name                  = azurerm_eventhub.this.name
  eventhub_authorization_rule_id = azurerm_eventhub_namespace_authorization_rule.azure-ad[0].id

  dynamic "enabled_log" {
    for_each = toset(var.azure-ad-logs.log-types)
    iterator = category
    content {
      category = category.value
      retention_policy {
        enabled = false
      }
    }
  }
}
