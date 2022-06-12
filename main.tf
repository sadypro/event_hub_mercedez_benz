terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  tags = {
    Environment = var.EnvironmentName
    CostCentre  = "Mercedez-Benz-Mobility"
    Project     = "VehicleData"
    Department  = "Analytics"
  }
}

module "mercedez_benz_eventhub" {
  source = "./modules/eventhub"

  region                     = var.region
  resource_group_name        = var.resource_group_name
  sku                        = var.sku
  namespace_capacity         = var.namespace_capacity
  enviornment_name           = var.EnvironmentName
  eventhub_namespace_name    = var.eventhub_namespace
  eventhub_name              = var.eventhub_name
  eventhub_message_retention = var.eventhub_message_retention
  eventhub_partition_count   = var.eventhub_partition_count
  tags                       = local.tags
  auto_inflate               = var.auto_inflate

}