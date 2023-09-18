
# https://github.com/hashicorp/terraform-provider-azurerm/issues/12592
resource "azuread_service_principal" "datadog" {
  application_id = azuread_application.datadog.application_id
  use_existing   = true
}

resource "azurerm_role_assignment" "datadog" {
  for_each             = toset(var.subscription-ids)
  scope                = "/subscriptions/${each.value}"
  role_definition_name = "Monitoring Reader"
  principal_id         = azuread_service_principal.datadog.id
}
