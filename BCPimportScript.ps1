# Set variables
$serverName = "GZN00000684"  # Change this to your SQL Server instance
$databaseName = "Progeny"  # Change this to your database name
$schemaName = "PY1"
$tableName = "[20250307_CHC_Claim_RAW]"        # Change this to your desired table name
$csvFilePath = "C:\Users\RLakkam\repos\DataImport\Test\Top10_Records.TXT"  # Change this to the CSV file path
$xmlFormatFile = "C:\Users\RLakkam\repos\DataImport\Test\test.xml"


# Run BCP to import data
$cmd = "bcp $schemaName.$tableName in `"$csvFilePath`" -S $serverName -d $databaseName -T -F 2 -f `"$xmlFormatFile`" -e error.log "
$cmd
Invoke-Expression -Command $cmd
 
Write-Output "Data import complete."