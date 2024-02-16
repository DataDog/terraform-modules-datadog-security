terraform {
  required_version = ">= 1.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.71.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.29.0"
    }
  }
}

provider "azurerm" {
  features {}
}