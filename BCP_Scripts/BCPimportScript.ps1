# Set variables
$serverName = "PH-CLAIMSROI"  # Change this to your SQL Server instance
$databaseName = "`"Community Health Choice`""  # Change this to your database name
$schemaName = "PY1"
$tableName = "[20250307_CHC_Claim_Baseline]"        # Change this to your desired table name
$csvFilePath = "C:\Users\rlakkam\Documents\BCP\20250307_CHC_Claim.TXT"  # Change this to the CSV file path
$xmlFormatFile = "C:\Users\rlakkam\Documents\BCP\XmlFormatFile2.xml"


# Run BCP to import data
$cmd = "bcp $schemaName.$tableName in `"$csvFilePath`" -S $serverName -d $databaseName -T -F 2 -f `"$xmlFormatFile`" -e error.log "
$cmd
Invoke-Expression -Command $cmd
 
Write-Output "Data import complete."