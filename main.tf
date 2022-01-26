# Provides configuration details for Terraform.
terraform {
  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "~>2.30.0"
      }
  }
}