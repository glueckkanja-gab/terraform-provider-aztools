resource "aztools_resource_name" "example_default_precendence" {
  resource_type    = "azurerm_resource_group"
  name             = "example"
  prefixes         = ["myprefix"]
  suffixes         = ["mysuffix", "001"]
  name_precendence = ["prefix", "prefixes", "name", "environment", "suffixes"]
}

output "example_default_precendence" {
  value = aztools_resource_name.example_default_precendence.result
}

//----------------

resource "aztools_resource_name" "example_custom_precendence" {
  name             = "example"
  resource_type    = "azurerm_resource_group"
  location         = "westeurope"
  prefixes         = ["prefixes"]
  suffixes         = ["suffixes", "002"]
  name_precendence = ["prefixes", "name", "location", "environment", "suffixes", "prefix"]
}

output "example_custom_precendence" {
  value = aztools_resource_name.example_custom_precendence.result
}

//----------------

resource "aztools_resource_name" "passthrough" {
  name          = "example1"
  resource_type = "azurerm_resource_group"
  convention    = "passthrough"
}

output "example_passthrough" {
  value = aztools_resource_name.passthrough.result
}
