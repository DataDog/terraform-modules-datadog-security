resource "datadog_api_key" "api_key" {
  name = var.datadog-api-key-name
}

data "http" "template" {
  url = "https://raw.githubusercontent.com/DataDog/datadog-serverless-functions/master/azure/deploy-to-azure/function_template.json"
}

resource "azurerm_eventhub_namespace" "this" {
  name                = var.event-hub-namespace-name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  capacity            = 1
}

resource "azurerm_eventhub" "this" {
  name                = var.event-hub-name
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = azurerm_resource_group.rg.name
  partition_count     = 1
  message_retention   = 1
}

resource "azurerm_resource_group_template_deployment" "datadog-function" {
  name                = var.datadog-function-name
  resource_group_name = azurerm_resource_group.rg.name
  template_content    = replace(replace(data.http.template.response_body, "\"type\": \"string\"", "\"type\": \"String\""), "\"type\": \"securestring\"", "\"type\": \"SecureString\"")
  deployment_mode     = "Incremental"

  parameters_content = jsonencode({
    "eventhubNamespace" = {
      value = azurerm_eventhub_namespace.this.name,
    },
    "eventhubName" = {
      value = azurerm_eventhub.this.name,
    },
    "apiKey" = {
      value = datadog_api_key.api_key.key,
    },
  })
  lifecycle {
    ignore_changes = [parameters_content]
  }
}
