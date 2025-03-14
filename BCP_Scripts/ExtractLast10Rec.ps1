# Set variables
$tableName = "20250307_CHC_Claim_RAW"  # Change this to your desired table name
$csvFilePath = "C:\Users\rlakkam\Documents\20250307_CHC_Claim.TXT"  # Change this to the CSV file path
$outputFilePath = "C:\Users\rlakkam\Documents\Last10_Records.TXT"  # Output file path
$delimiter = "|"  # Change this if your file uses a different delimiter

# Read only the last 10 lines including headers
$last10Records = Get-Content -Path $csvFilePath | Select-Object -Last 11 

# Write the Last 10 records to a new file
$last10Records | Out-File -FilePath $outputFilePath -Encoding UTF8

Write-Output "Last 10 records written to $outputFilePath"
