output "event-hub-name" {
  value = azurerm_eventhub.this.name
}

output "event-hub-namespace" {
  value = azurerm_eventhub_namespace.this.name
}