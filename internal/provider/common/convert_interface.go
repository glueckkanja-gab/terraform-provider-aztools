package common

import (
	"fmt"
)

// ConvertStringToInterface -
func ConvertStringToInterface(source []string) []interface{} {
	s := make([]interface{}, len(source))
	for i, v := range source {
		s[i] = v
	}
	return s
}

// ConvertInterfaceToString -
func ConvertInterfaceToString(source []interface{}) []string {
	s := make([]string, len(source))
	for i, v := range source {
		s[i] = fmt.Sprint(v)
	}
	return s
}
