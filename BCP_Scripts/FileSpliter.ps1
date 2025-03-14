$InputFile = "C:\Users\rlakkam\Documents\BCP\20250307_CHC_Claim_Baseline.TXT"
$OutputDir = "C:\Users\rlakkam\Documents\BCP\20250307_CHC_Claim_Baseline_Chunks"
$ChunkSizeMB = 500
 
# Ensure output directory exists
if (!(Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}
 
# Read the header
$reader = [System.IO.StreamReader]::new($InputFile)
$header = $reader.ReadLine()
 
# Initialize chunk variables
$chunkIndex = 1
$lineCount = 0
$chunkSizeBytes = $ChunkSizeMB * 1MB
$currentFile = "$OutputDir\chunk_$chunkIndex.csv"
$writer = [System.IO.StreamWriter]::new($currentFile)
$writer.WriteLine($header)
 
while (($line = $reader.ReadLine()) -ne $null) {
    $writer.WriteLine($line)
    $lineCount++
    # Check if the current file size exceeds the limit
    if ($writer.BaseStream.Length -ge $chunkSizeBytes) {
        $writer.Close()
        $chunkIndex++
        $currentFile = "$OutputDir\chunk_$chunkIndex.csv"
        $writer = [System.IO.StreamWriter]::new($currentFile)
        $writer.WriteLine($header)
    }
}
 
# Cleanup
$writer.Close()
$reader.Close()
 
Write-Output "File split completed. Chunks saved in $OutputDir"