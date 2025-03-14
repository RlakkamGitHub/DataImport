# Set variables
$schemaName = "PY1"
$tableName = "[20250307_CHC_Claim_RAW]"        # Change this to your desired table name
$csvFilePath = "C:\Users\RLakkam\repos\DataImport\Top10_Records.TXT"  # Change this to the CSV file path
$delimiter = "|"  # Change this if your file uses a different delimiter

# Read only the first 10 lines including headers
$top10Records = Get-Content -Path $csvFilePath | Select-Object -First 11 | ConvertFrom-Csv -Delimiter $delimiter

# Extract column names
$columns = $top10Records[0].PSObject.Properties.Name

# Generate SQL Table Definition
$tableColumns = $columns | ForEach-Object { "[$_] NVARCHAR(MAX)" }
$createTableSQL = @"
IF OBJECT_ID('$tableName', 'U') IS NOT NULL
    DROP TABLE $schemaName.$tableName;
CREATE TABLE $schemaName.$tableName (
    $(($tableColumns -join ",`n    "))
);
"@

# Execute SQL to create table
#Invoke-Sqlcmd -ServerInstance $serverName -Database $databaseName -Query $createTableSQL
$createTableSQL | Out-File 'CreateTableNoIdentity.sql'
