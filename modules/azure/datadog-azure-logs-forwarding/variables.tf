variable "event-hub-namespace-name" {
  default     = "datadog-integration"
  type        = string
  description = "Name of the Event Hub Namespace to create"
}

variable "event-hub-name" {
  default     = "azure-logs-to-datadog"
  type        = string
  description = "Name of the Event Hub to create"
}

variable "datadog-function-name" {
  default     = "datadog-logs-forwarder"
  type        = string
  description = "Name of the Azure Function to create for the Datadog logs forwarder"
}

variable "datadog-api-key-name" {
  default     = "azure-inttegration"
  type        = string
  description = "Name of the Datadog API key to create, which will be used by the Azure Function to send logs to Datadog"
}

variable "resource-group-name" {
  default     = "datadog-integration"
  type        = string
  description = "Name of the Resource Group to create, in which resources related to log forwarding will be created"
}

variable "resource-group-location" {
  default     = "west europe"
  type        = string
  description = "Location of the Resource Group to create, in which resources related to log forwarding will be created"
}

variable "azure-ad-logs" {
  type = object({
    enabled                 = optional(bool, false)
    log-types               = optional(list(string), ["SignInLogs", "AuditLogs", "NonInteractiveUserSignInLogs", "ServicePrincipalSignInLogs"])
    diagnostic-setting-name = optional(string, "datadog-azure-ad-logs")
  })
  description = "Configuration for forwarding Azure AD logs to Datadog"
}

variable "azure-activity-logs" {
  type = object({
    subscription-ids = list(string)
    # https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/activity-log-schema?WT.mc_id=Portal-Microsoft_Azure_Monitoring#categories
    log-types               = optional(list(string), ["Administrative"])
    diagnostic-setting-name = optional(string, "datadog-azure-activity-logs")
  })
  description = "Configuration for forwarding Azure Activity logs to Datadog"
}