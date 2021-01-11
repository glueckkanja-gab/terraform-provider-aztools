terraform {
  required_providers {
    //azurerm = {
    //  source = "hashicorp/azurerm"
    //}
    azfoundation = {
      source = "github.com/petr-stupka/azfoundation"
    }
  }
}

locals {
  sep = "-"
}

//rovider "azurerm" {
// features {}
//

provider "azfoundation" {
  environment           = "prd"
  separator             = local.sep
  convention            = "default"
  lowercase             = true
  schema_naming_path    = "./naming_schema/schema.naming.json"
  schema_locations_path = "./naming_schema/schema.locations.json"
}
