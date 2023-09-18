resource "azurerm_eventhub_namespace_authorization_rule" "azure-activity" {
  for_each            = toset(var.azure-activity-logs.subscription-ids)
  namespace_name      = azurerm_eventhub_namespace.this.name
  name                = "azure-activity-logs-${each.value}"
  resource_group_name = var.resource-group-name

  send   = true
  listen = false
  manage = false
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  for_each = toset(var.azure-activity-logs.subscription-ids)

  name               = var.azure-activity-logs.diagnostic-setting-name
  target_resource_id = "/subscriptions/${each.value}"

  # Forward events to the Event Hub
  eventhub_name                  = azurerm_eventhub.this.name
  eventhub_authorization_rule_id = azurerm_eventhub_namespace_authorization_rule.azure-activity[each.key].id

  dynamic "enabled_log" {
    for_each = var.azure-activity-logs.log-types
    iterator = category # Use a custom iterator, since 'each' here refers to the outer for_each (subscription ID)
    content {
      category = category.value
    }
  }
}
