# Convert CAF json schema to aznaming json schema (develop script been faster than manual convert)

$sourceFiles = @(".\convert_caf\resourceDefinition.json", "convert_caf\resourceDefinition_out_of_docs.json")
$destinationFolder = ".\examples\naming_schema"

$convertedObject = @()

foreach ($sourceFile in $sourceFiles) {

    $sourceObject = Get-Content -Path $sourceFile | ConvertFrom-Json
    
    foreach ($sourceItem in $sourceObject) {

        $destinationObject = New-Object -TypeName PSCustomObject
    
        $destinationObject = [ordered]@{
            resourceType    = $sourceItem.name
            prefix          = $sourceItem.slug
            minLength       = $sourceItem.min_length
            maxLength       = $sourceItem.max_length
            validationRegex = ([System.Text.RegularExpressions.Regex]::Unescape($sourceItem.validation_regex)).Replace('"', '').Replace('\', '')
            configuration   = [ordered]@{

                useEnvironment    = $true
                useLowerCase      = $sourceItem.lowercase -eq $true ? $true : $false
                useSeparator      = $sourceItem.dashes -eq $true ? $true : $false        
                denyDoubleHyphens = $sourceItem.invalid_double_dash -eq $true ? $true : $false
                namePrecedence    = @()
            }
        }

        $convertedObject += $destinationObject
    }
}

$convertedObject | ConvertTo-Json -Depth 100 | Out-File "$($destinationFolder)\schema.naming.json" -Force