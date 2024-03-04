variable "datadog-aws-role-name" {
  type        = string
  default     = "DatadogAWSIntegrationRole"
  description = "Name of the AWS IAM role to create for the Datadog integration"
}

variable "datadog-aws-role-path" {
  type        = string
  default     = "/"
  description = "Path of the AWS IAM role to create for the Datadog integration"
}