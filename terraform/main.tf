/*terraform {
  required_version = ">= 1.2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.70.0" # or any stable 3.x version
    }
  }
}
*/
provider "azurerm" {
  skip_provider_registration = true
  features {}
}
resource "azurerm_app_service" "webapp" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  site_config {
    always_on           = true
    windows_fx_version  = "DOTNET|4.0"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "0"
  }

  https_only = true
}
