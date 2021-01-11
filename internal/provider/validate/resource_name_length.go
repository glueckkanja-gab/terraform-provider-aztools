package validate

import (
	"strconv"

	"github.com/hashicorp/terraform-plugin-sdk/v2/diag"
)

// Length resourceName against MaxLength
func Length(resourceName string, resourceType string, maxLength int) (bool, diag.Diagnostics) {

	// Warning or errors can be collected in a slice type
	var diags diag.Diagnostics

	if len(resourceName) > maxLength {
		return false, append(diags, diag.Diagnostic{
			Severity: diag.Error,
			Summary:  "Invalid naming length for resourceType '" + resourceType + "' in result '" + resourceName + "', the result exceed MaxLength " + strconv.Itoa(maxLength),
		})
	}

	return true, nil
}
