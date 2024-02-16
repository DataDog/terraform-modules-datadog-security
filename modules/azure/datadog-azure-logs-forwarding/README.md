# Terraform module to forward Azure and Azure AD logs to Datadog

This module allows you to easily configure log forwarding from your Azure AD tenant and Azure subscriptions to Datadog.

It will create:
- An Event Hub to hold the forwarded logs, and an Azure Function acting as the forwarder
- Optionally, an Azure AD diagnostic setting to forward Azure AD logs to Datadog
- Optionally, a subscription-wide diagnostic setting to forward Azure Activity logs to Datadog

## Usage

Before using this module:

- You must be authenticated against Azure through the Azure CLI (`az login`)
- You must have Datadog credentials (`DD_API_KEY` and `DD_APP_KEY`) available in your environment
- You must have the necessary permissions on your Azure environment

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.71.0 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | ~> 3.29.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~> 3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.71.0 |
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | ~> 3.29.0 |
| <a name="provider_http"></a> [http](#provider\_http) | ~> 3.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_namespace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |
| [azurerm_eventhub_namespace_authorization_rule.azure-activity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_authorization_rule) | resource |
| [azurerm_eventhub_namespace_authorization_rule.azure-ad](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_authorization_rule) | resource |
| [azurerm_monitor_aad_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_aad_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group_template_deployment.datadog-function](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource |
| [datadog_api_key.api_key](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/api_key) | resource |
| [http_http.template](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure-activity-logs"></a> [azure-activity-logs](#input\_azure-activity-logs) | Configuration for forwarding Azure Activity logs to Datadog | <pre>object({<br>    subscription-ids = list(string)<br>    # https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/activity-log-schema?WT.mc_id=Portal-Microsoft_Azure_Monitoring#categories<br>    log-types               = optional(list(string), ["Administrative"])<br>    diagnostic-setting-name = optional(string, "datadog-azure-activity-logs")<br>  })</pre> | n/a | yes |
| <a name="input_azure-ad-logs"></a> [azure-ad-logs](#input\_azure-ad-logs) | Configuration for forwarding Azure AD logs to Datadog | <pre>object({<br>    enabled                 = optional(bool, false)<br>    log-types               = optional(list(string), ["SignInLogs", "AuditLogs", "NonInteractiveUserSignInLogs", "ServicePrincipalSignInLogs"])<br>    diagnostic-setting-name = optional(string, "datadog-azure-ad-logs")<br>  })</pre> | n/a | yes |
| <a name="input_datadog-api-key-name"></a> [datadog-api-key-name](#input\_datadog-api-key-name) | Name of the Datadog API key to create, which will be used by the Azure Function to send logs to Datadog | `string` | `"azure-inttegration"` | no |
| <a name="input_datadog-function-name"></a> [datadog-function-name](#input\_datadog-function-name) | Name of the Azure Function to create for the Datadog logs forwarder | `string` | `"datadog-logs-forwarder"` | no |
| <a name="input_event-hub-name"></a> [event-hub-name](#input\_event-hub-name) | Name of the Event Hub to create | `string` | `"azure-logs-to-datadog"` | no |
| <a name="input_event-hub-namespace-name"></a> [event-hub-namespace-name](#input\_event-hub-namespace-name) | Name of the Event Hub Namespace to create | `string` | `"datadog-integration"` | no |
| <a name="input_resource-group-location"></a> [resource-group-location](#input\_resource-group-location) | Location of the Resource Group to create, in which resources related to log forwarding will be created | `string` | `"west europe"` | no |
| <a name="input_resource-group-name"></a> [resource-group-name](#input\_resource-group-name) | Name of the Resource Group to create, in which resources related to log forwarding will be created | `string` | `"datadog-integration"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_event-hub-name"></a> [event-hub-name](#output\_event-hub-name) | n/a |
| <a name="output_event-hub-namespace"></a> [event-hub-namespace](#output\_event-hub-namespace) | n/a |
<!-- END_TF_DOCS -->