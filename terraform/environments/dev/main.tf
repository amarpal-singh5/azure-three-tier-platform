# terraform/environments/dev/main.tf

terraform {
  required_version = ">= 1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "networking" {
  source              = "../../modules/networking"
  prefix              = "azshop"
  resource_group_name = "rg-azshop-dev"
  location            = "eastus"
}