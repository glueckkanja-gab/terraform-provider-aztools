package common

// ConvertStringToInterface -
func ConvertStringToInterface(source []string) []interface{} {
	s := make([]interface{}, len(source))
	for i, v := range source {
		s[i] = v
	}
	return s
}
