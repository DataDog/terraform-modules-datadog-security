data "azuread_client_config" "current" {}

data "azuread_application_published_app_ids" "well_known" {}

resource "azuread_service_principal" "msgraph" {
  application_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
  use_existing   = true
}


locals {
  # 
  permissions = [
    "Application.Read.All",
    "Directory.Read.All",
    "Group.Read.All",
    "Policy.Read.All",
    "User.Read.All"
  ]
}

resource "azuread_application" "datadog" {
  display_name = var.azure-ad-application-name

  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph

    dynamic "resource_access" {
      for_each = toset(local.permissions)
      iterator = permission
      content {
        type = "Role"
        id   = azuread_service_principal.msgraph.app_role_ids[permission.value]
      }
    }
  }
}

resource "azuread_application_password" "datadog" {
  application_object_id = azuread_application.datadog.object_id
  display_name          = "datadog-integration"
}
