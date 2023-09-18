# Terraform module to easily enable the Azure AD integration and CSPM

This module allows you to easily configure the Datadog Azure AD integration and CSPM.

It will create:
- An Azure AD app registration with the right minimal permissions
- A role assignment in each subscription to monitor, for the `Monitoring Reader` role
- The Datadog Azure integration, for each subscription

## Usage

Before using this module:

- You must be authenticated against Azure through the Azure CLI (`az login`)
- You must have Datadog credentials (`DD_API_KEY` and `DD_APP_KEY`) available in your environment
- You must have the necessary permissions on your Azure environment

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.15.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.71.0 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 2.15.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.71.0 |
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.datadog](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_password.datadog](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_service_principal.datadog](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azuread_service_principal.msgraph](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_role_assignment.datadog](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [datadog_integration_azure.azure-integration](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/integration_azure) | resource |
| [azuread_application_published_app_ids.well_known](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/application_published_app_ids) | data source |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure-ad-application-name"></a> [azure-ad-application-name](#input\_azure-ad-application-name) | Name of the Azure AD App Registration to create | `string` | `"datadog-azure-integration"` | no |
| <a name="input_subscription-ids"></a> [subscription-ids](#input\_subscription-ids) | List of subscription IDs to enable the integration for | `list(string)` | n/a | yes |
| <a name="input_tenant-id"></a> [tenant-id](#input\_tenant-id) | ID of the Azure AD tenant | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->