terraform {
  required_version = ">= 1.3"
}

# Enable CloudTrail and ship the logs to Datadog
module "cloudtrail" {
  source = "git::https://github.com/DataDog/datadog-security-terraform-modules//modules/aws/datadog-aws-cloudtrail"
}

# Install the Datadog AWS integration and enable CSPM resource collection
module "cspm" {
  source = "git::https://github.com/DataDog/datadog-security-terraform-modules//modules/aws/datadog-aws-cspm"
}