
# Datadog security Terraform modules

This repository contains Terraform modules to facilitate common integrations between Datadog security products and cloud providers.

> [!Note]  
> This repository is currently in beta. Please report any problem you might have by opening a GitHub issue.

## Available modules

| Module | Description |
|:---:|:---:|
| [datadog-aws-cloudtrail](./modules/aws/datadog-aws-cloudtrail/) | Creates a CloudTrail trail and ships the logs to Datadog Logs |
| [datadog-aws-cspm](./modules/aws/datadog-aws-cspm/) | Enables the Datadog AWS integration for CSPM |
| [datadog-azure-logs-forwarding](./modules/azure/datadog-azure-logs-forwarding/) | Ships Azure AD and Azure activity/sign-in logs to Datadog |
| [datadog-azure-cspm](./modules/azure/datadog-azure-cspm/) |  Enables the Datadog Azure and Azure AD integrations for CSPM |

## Pre-requisites

1. Make sure you have a Datadog [API key]([url](https://app.datadoghq.com/organization-settings/api-keys)) and [application key]([url](https://app.datadoghq.com/personal-settings/application-keys)) in your environment:

```
export DD_API_KEY=...
export DD_APP_KEY=...
```

2. Authenticate to your cloud environment (AWS or Azure), for instance using:

```
aws-vault exec target-account # Or equivalently, 'az login' for Azure
```

## Sample usage

See the [examples](./examples/) for sample usage.
