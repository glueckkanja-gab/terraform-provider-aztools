package models

// LocationsMapSchema -
type LocationsMapSchema map[string]string

// NamingSchema -
type NamingSchema struct {
	ResourceType    string              `json:"resourceType"`
	Abbreviation    string              `json:"abbreviation"`
	MinLength       int                 `json:"minLength"`
	MaxLength       int                 `json:"maxLength"`
	ValidationRegex string              `json:"validationRegex"`
	Configuration   ConfigurationSchema `json:"configuration"`
}

// ConfigurationSchema -
type ConfigurationSchema struct {
	UseEnvironment    bool     `json:"useEnvironment"`
	UseLowerCase      bool     `json:"useLowerCase"`
	UseSeparator      bool     `json:"useSeparator"`
	DenyDoubleHyphens bool     `json:"denyDoubleHyphens"`
	NamePrecedence    []string `json:"namePrecedence"`
}
