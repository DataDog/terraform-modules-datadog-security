# Collect Azure AD and Azure logs
module "azure-logs-forwarding" {
  source = "git::https://github.com/DataDog/datadog-security-terraform-modules//modules/azure/datadog-azure-logs-forwarding"

  resource-group-name     = "datadog-integration"
  resource-group-location = "west europe"

  # Disable this if you're not a tenant administrator or only want to collect Azure logs
  azure-ad-logs = {
    enabled = true
    enabled-log-types = [
      "SignInLogs",
      "AuditLogs",
      "NonInteractiveUserSignInLogs",
      "ServicePrincipalSignInLogs"
    ]
  }

  azure-activity-logs = {
    subscription-ids = ["<YOUR-SUBSCRIPTION-ID>"]
    log-types        = ["Administrative"]
  }
}

# Enable the Azure integration and CSPM
module "azure-cspm" {
  source = "git::https://github.com/DataDog/datadog-security-terraform-modules//modules/azure/datadog-azure-cspm"

  tenant-id        = "<YOUR-TENANT-ID>"
  subscription-ids = ["<YOUR-SUBSCRIPTION-ID>"]
}