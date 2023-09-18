# Enable CloudTrail and ship the logs to Datadog
module "cloudtrail" {
  source = "../../modules/aws/datadog-aws-cloudtrail"
}

# Install the Datadog AWS integration and enable CSPM resource collection
module "cspm" {
  source = "../../modules/aws/datadog-aws-cspm"
}