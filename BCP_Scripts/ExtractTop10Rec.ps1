# Set variables
$tableName = "20250307_CHC_Claim_RAW"  # Change this to your desired table name
$csvFilePath = "C:\Users\rlakkam\Documents\BCP\20250307_CHC_Claim_Baseline.TXT"  # Change this to the CSV file path
$outputFilePath = "C:\Users\rlakkam\Documents\BCP\Top10_Records2.TXT"  # Output file path
$delimiter = "|"  # Change this if your file uses a different delimiter

# Read only the first 10 lines including headers
$top10Records = Get-Content -Path $csvFilePath | Select-Object -First 11 

# Write the top 10 records to a new file
$top10Records | Out-File -FilePath $outputFilePath -Encoding UTF8

Write-Output "Top 10 records written to $outputFilePath"
