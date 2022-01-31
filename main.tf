# Provides configuration details for Terraform.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.93.1"
    }
  }
}

# Provides configuration details for the Azure Terraform provider
provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

# Create a budget for the subscription
resource "azurerm_consumption_budget_subscription" "example" {
  name            = "Budget"
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.budget-amount
  time_grain = "Monthly"

  time_period {
    start_date = "2022-01-01T00:00:00Z"
    end_date   = "2023-12-31T00:00:00Z"
  }

  notification {
    enabled   = true
    threshold = var.notification-threshold-equalto
    operator  = "EqualTo"

    contact_emails = var.email-address
  }

  notification {
    enabled        = true
    threshold      = var.notification-threshold-forecasted
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = var.email-address
  }
}