package validate

import (
	"regexp"

	"github.com/hashicorp/terraform-plugin-sdk/v2/diag"
)

// DoubleHyphens validate resourceName with double hyphens regex
func DoubleHyphens(resourceName string, resourceType string) (bool, diag.Diagnostics) {

	// Warning or errors can be collected in a slice type
	var diags diag.Diagnostics

	regEx, err := regexp.Compile("(--)")
	if err != nil {
		return false, diag.FromErr(err)
	}

	// if regexp.MatchString returned true (found double hyphens) => return false
	if regEx.MatchString(resourceName) {
		return false, append(diags, diag.Diagnostic{
			Severity: diag.Error,
			Summary:  "Invalid AF naming for resourceType '" + resourceType + "' in result '" + resourceName + "', double hyphens are not allowed",
		})
	}

	return true, nil
}
