# Full AWS integration example

This example:

- Sets up CloudTrail (multi-region) in an AWS account
- Forwards the logs to Datadog
- Enables the AWS Datadog integration
- Enables Datadog CSPM resource collection

Before running, you must be authenticated to AWS and have the `DD_API_KEY` and `DD_APP_KEY` environment variables set appropriately.