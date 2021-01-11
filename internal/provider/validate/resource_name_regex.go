package validate

import (
	"regexp"

	"github.com/hashicorp/terraform-plugin-sdk/v2/diag"
)

// RegEx validate resourceName using validationRegEx
func RegEx(resourceName string, resourceType string, validationRegEx string) (bool, diag.Diagnostics) {

	// Warning or errors can be collected in a slice type
	var diags diag.Diagnostics

	regEx, err := regexp.Compile(validationRegEx)
	if err != nil {
		return false, diag.FromErr(err)
	}

	if !regEx.MatchString(resourceName) {
		return false, append(diags, diag.Diagnostic{
			Severity: diag.Error,
			Summary:  "Invalid naming configuration for resourceType '" + resourceType + "' in result '" + resourceName + "', the validation RegEx pattern '" + validationRegEx + "' doesn't match the result",
		})
	}

	return true, nil
}
