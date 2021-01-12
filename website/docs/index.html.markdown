---
layout: "aztools"
page_title: "Provider: AzTools"
sidebar_current: "docs-aztools-index"
description: |-
  Terraform provider aztools.
---

# AzTools Provider

Provider to support implementing [Recommended naming and tagging conventions](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging) for Azure resources.

Azure defines [naming rules and restrictions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules) for Azure resources. This guidance provides detailed recommendations to support enterprise cloud adoption efforts.

Use the navigation to the left to read about the available resources.

~> **Note:** This resource it's in preview and may change in future releases.

## Example Usage

```hcl
provider "aztools" {
  environment = "sandbox"
  separator = "-"
  lowercase = false
  schema_naming_path = "./schema.naming.json"
  schema_locations_path = "./schema.locations.json"
}
```

## Argument Reference

The following arguments are supported:

* `environment` - (Optional) Environment atribute. Defaults to `sandbox`.
* `separator` - (Optional) Separator between resource arguments. Defaults to `-`.
* `lowercase` - (Optional) Convert result to lowercase. Possible values are: `true` or `false`. Defaults to `false`.
* `schema_naming_path` - (Optional) Relative file path from root module to json schema file. Defaults to `./schema.naming.json`
* `schema_locations_path` - (Optional) Relative file path from root module to json schema file. Defaults to `./schema.locations.json`


~> **Note:** `separator` and `environment` can be overrriden using atributes in aztools_resource_name resource

## Example schema.naming.json

```json
[
  {
    "resourceType": "azurerm_resource_group",
    "prefix": "rg",
    "minLength": 1,
    "maxLength": 90,
    "validationRegex": "^[a-zA-Z0-9-._()]{0,89}[a-zA-Z0-9-_()]$",
    "configuration": {
      "useEnvironment": true,
      "useLowerCase": false,
      "useSeparator": true,
      "denyDoubleHyphens": true,
      "namePrecedence": []
    }
  }
]
```

Result: `rg-prefixes-example-sandbox-suffixes-001`

```json
[
  {
    "resourceType": "azurerm_resource_group_custom",
    "prefix": "rg",
    "minLength": 1,
    "maxLength": 90,
    "validationRegex": "^[a-zA-Z0-9-._()]{0,89}[a-zA-Z0-9-_()]$",
    "configuration": {
      "useEnvironment": true,
      "useLowerCase": false,
      "useSeparator": true,
      "denyDoubleHyphens": true,
      "namePrecedence": ["prefixes", "name", "location", "environment", "suffixes", "prefix"]
    }
  }
]
```

Result: `prefixes-example-weeu-sandbox-suffixes-001-rg`

## Example schema.locations.json

```json
{
  "westeurope": "weeu",
  "norteurope": "neeu"
}
```