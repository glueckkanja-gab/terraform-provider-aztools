resource "aztools_resource_name" "example_default_precedence" {
  resource_type   = "azurerm_resource_group"
  name            = "example"
  prefixes        = ["myprefix"]
  suffixes        = ["mysuffix", "001"]
  name_precedence = ["abbreviation", "prefixes", "name", "environment", "suffixes"]
}

output "example_default_precedence" {
  value = aztools_resource_name.example_default_precedence.result
}

//----------------

resource "aztools_resource_name" "example_custom_precedence" {
  name            = "example"
  resource_type   = "azurerm_resource_group"
  location        = "westeurope"
  prefixes        = ["prefixes"]
  suffixes        = ["suffixes", "002"]
  name_precedence = ["prefixes", "name", "location", "environment", "suffixes", "abbreviation"]
}

output "example_custom_precedence" {
  value = aztools_resource_name.example_custom_precedence.result
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
