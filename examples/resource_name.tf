resource "aztools_resource_name" "example_precedence_default" {
  resource_type = "azurerm_resource_group"
  name          = "example"
  location      = "westeurope"
  prefixes      = ["myprefix"]
  suffixes      = ["mysuffix", "001"]
}

output "example_precedence_default" {
  value = aztools_resource_name.example_precedence_default.result
}

//----------------

resource "aztools_resource_name" "example_precedence_custom" {
  name            = "example"
  resource_type   = "azurerm_resource_group"
  location        = "westeurope"
  prefixes        = ["myprefix"]
  suffixes        = ["mysuffix", "001"]
  name_precedence = ["prefixes", "name", "environment", "suffixes", "abbreviation"]
}

output "example_precedence_custom" {
  value = aztools_resource_name.example_precedence_custom.result
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

//-----------------

resource "aztools_resource_name" "example_hash_default" {
  name          = "example"
  resource_type = "azurerm_key_vault"
  suffixes      = ["001", ]
}

output "example_hash_default" {
  value = aztools_resource_name.example_hash_default.result
}

//-----------------

resource "aztools_resource_name" "example_hash_custom" {
  name          = "example"
  resource_type = "azurerm_key_vault"
  hash_length   = 5
  suffixes      = ["001", ]
}

output "example_hash_custom" {
  value = aztools_resource_name.example_hash_custom.result
}
