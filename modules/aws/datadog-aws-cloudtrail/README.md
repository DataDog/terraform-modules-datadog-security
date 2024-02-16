# Datadog Cloud SIEM + CloudTrail logs

This module creates a CloudTrail trail with a supporting S3 bucket, and ensures that the logs are shipped to Datadog through a Lambda forwarder.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.17 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | ~> 3.30 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.17 |
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | ~> 3.30 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudformation_stack.datadog_forwarder](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack) | resource |
| [aws_cloudtrail.trail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |
| [aws_lambda_permission.allow_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_s3_bucket.cloudtrail-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_notification.bucket_notification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_s3_bucket_policy.cloudtrail-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_secretsmanager_secret.dd_api_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.dd_api_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [datadog_api_key.cloudtrail](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/api_key) | resource |
| [null_resource.delete-concurrency](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudtrail-trail-name"></a> [cloudtrail-trail-name](#input\_cloudtrail-trail-name) | Name of the CloudTrail trail to create | `string` | `"datadog-trail"` | no |
| <a name="input_dd-api-key-name"></a> [dd-api-key-name](#input\_dd-api-key-name) | Name of the Datadog API key to create and use in the AWS Lambda forwarder | `string` | `"datadog-cloudtrail-api-key"` | no |
| <a name="input_dd-site"></a> [dd-site](#input\_dd-site) | Datadog site to use for the AWS Lambda forwarder | `string` | `"datadoghq.com"` | no |
| <a name="input_enable-cloudtrail-data-events"></a> [enable-cloudtrail-data-events](#input\_enable-cloudtrail-data-events) | Enable CloudTrail data events for all Lambda functions and S3 buckets | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_datadog-forwarder-arn"></a> [datadog-forwarder-arn](#output\_datadog-forwarder-arn) | n/a |
<!-- END_TF_DOCS -->