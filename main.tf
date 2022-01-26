# Provides configuration details for Terraform.
terraform {
  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "~>2.30.0"
      }
  }
}

# Provides configuration details for the Azure Terraform provider
provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
  name = "rg-weu-test-001"
  location = "westeurope"
  tags = {
    "costcenter" = "personal"
    "environment" = "test"
  }
}

# resource "azurerm_consumption_budget_resource_group" "rg_budget" {
#   name = "${azurerm_resource_group.DefaultResourceGroup-WEU}_budget"
#   amount = 50
#   time_grain = "Monthly"
#   time_period {
#     start_date = formatdate("2022-01-01'T'0:0:0Z",timestamp())
#   }
#   resource_group_id = azurerm_resource_group./subscriptions/b8595241-20b8-4f79-acff-f3be0a5ee472/resourceGroups/DefaultResourceGroup-WEU
# }