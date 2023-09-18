variable "enable-cloudtrail-data-events" {
  type    = bool
  default = false
  description = "Enable CloudTrail data events for all Lambda functions and S3 buckets"
}

variable "cloudtrail-trail-name" {
  type = string
  default = "datadog-trail"
  description = "Name of the CloudTrail trail to create"
}

variable "dd-api-key-name" {
  type = string
  default = "datadog-cloudtrail-api-key"
  description = "Name of the Datadog API key to create and use in the AWS Lambda forwarder"
}

variable "dd-site" {
  type = string
  default = "datadoghq.com"
  description = "Datadog site to use for the AWS Lambda forwarder"
}