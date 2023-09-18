
# Datadog security Terraform modules

This repository contains Terraform modules to facilitate common integrations between Datadog security products and cloud providers.

> [!IMPORTANT]  
> This repository is currently in beta. Please report any problem you might have by opening a GitHub issue.

## Available modules

| Module | Description |
|:---:|:---:|
| [datadog-aws-cloudtrail](./modules/aws/datadog-aws-cloudtrail/) | Creates a CloudTrail trail and ships the logs to Datadog Logs |
| [datadog-aws-cspm](./modules/aws/datadog-aws-cspm/) | Enables the Datadog AWS integration for CSPM |

## Pre-requisites

To use these modules, you must first be authenticated against your cloud provider and have your Datadog API key and APP key in your environment, for instance:

```
aws-vault exec target-account
export DD_API_KEY=...
export DD_APP_KEY=...
```

## Sample usage

See the [examples](./examples/aws-full-integration/) for sample usage.