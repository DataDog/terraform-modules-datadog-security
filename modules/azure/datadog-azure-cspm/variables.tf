variable "tenant-id" {
  type        = string
  description = "ID of the Azure AD tenant"
}

variable "azure-ad-application-name" {
  type        = string
  default     = "datadog-azure-integration"
  description = "Name of the Azure AD App Registration to create"
}

variable "subscription-ids" {
  type        = list(string)
  description = "List of subscription IDs to enable the integration for"
}