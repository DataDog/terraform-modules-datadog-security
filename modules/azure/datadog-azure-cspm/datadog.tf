resource "datadog_integration_azure" "azure-integration" {
  tenant_name   = var.tenant-id
  client_id     = azuread_application.datadog.application_id
  client_secret = azuread_application_password.datadog.value
  cspm_enabled  = true
  automute      = true
}
