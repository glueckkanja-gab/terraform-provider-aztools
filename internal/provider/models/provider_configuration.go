package models

// ProviderConfiguration -
type ProviderConfiguration struct {
	// Add whatever fields, client or connection info, etc. here
	UserAgent       string
	Convention      string
	Environment     string
	Separator       string
	Lowercase       bool
	HashLength      int
	ForceRefresh    bool
	NamingSchemaMap map[string]NamingSchema
	LocationsMap    LocationsMapSchema
}
