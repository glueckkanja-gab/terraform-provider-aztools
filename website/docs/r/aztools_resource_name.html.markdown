---
layout: "aztools"
page_title: "AzTools: aztools_resource_name"
sidebar_current: "docs-aztools-resource"
description: |-
  Naming generator resource.
---

# aztools_resource_name

Naming generator resource.

## Example Usage

```hcl
resource "aztools_resource_name" "example" {
  resource_type = "azurerm_resource_group"
  name = "foo"
  environment = "sandbox"
  location = "westeurope"
  separator = "-"
  prefixes = ["example"]
  suffixes = ["001"]
  name_precendence = ["prefix", "prefixes", "name", "environment", "suffixes"]
}
```

## Argument Reference

The following arguments are supported:

* `resource_type` - (Required) Resource Type defined in namingSchema.default.json
* `name` - (Required) Resource name
* `environment` - (Optional) Environment atribute
* `separator` - (Optional) Separator for resource arguments.
* `location` - (Optional) Location convert values from json map file
* `prefixes` - (Optional) A list of prefixes. Defaults to `[]`.
* `suffixes` - (Optional) A list of suffixes. Defaults to `[]`.
* `atribute_precendence` - (Optional) A list of atribute precedence. Defaults to `["prefix", "prefixes", "name", "location", "environment", "suffixes"]`.

