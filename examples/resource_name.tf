resource "azfoundation_resource_name" "example" {
  resource_type    = "azurerm_resource_group"
  name             = "XXXXX"
  prefixes         = ["prefixes"]
  suffixes         = ["suffixes", "001"]
  name_precendence = ["prefix", "prefixes", "name", "location", "environment", "suffixes"]
}

output "example" {
  value = azfoundation_resource_name.example.result
}

//----------------

resource "azfoundation_resource_name" "provider_example" {
  name             = "example"
  resource_type    = "azurerm_resource_group"
  location         = "westeurope"
  prefixes         = ["prefixes"]
  suffixes         = ["suffixes", "rg001"]
  name_precendence = ["prefixes", "name", "location", "environment", "suffixes", "prefix"]
}

output "provider_example" {
  value = azfoundation_resource_name.provider_example.result
}

//----------------

resource "azfoundation_resource_name" "provider_example1" {
  name          = "example1"
  resource_type = "azurerm_resource_group"
  convention    = "passthrough"
}

output "provider_example1" {
  value = azfoundation_resource_name.provider_example1.result
}
