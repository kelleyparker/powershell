#PowerShell Script: Weekly Backup and Transfer for OBS studio configuration on a Windows Computer
# The default OBS Studio configuration location is: C:\Users\[_USERNAME_]\AppData\Roaming\obs-studio
# This PowerShell script automates a weekly backup process:
#
# It compresses a folder located at [WINDOWS LOCATION HERE] into a ZIP file, appending the current date in YYYY-MM-DD format.
# The newly created ZIP file is then moved to [WINDOWS LOCATION HERE] files. In case of a move failure, the script retries every two hours until successful.

# Set variables
$SourceFolder = "[WINDOWS LOCATION HERE]"
$DestinationFolder = "[WINDOWS LOCATION HERE]"
$Date = Get-Date -Format "yyyy-MM-dd"
$ZipFileName = "obs-studio_$Date.zip"
$ZipPath = Join-Path -Path $SourceFolder -ChildPath $ZipFileName
$ZipFolderPath = Join-Path -Path $SourceFolder -ChildPath "ZIP"

# Create the ZIP folder if it doesn't exist
if (-not (Test-Path $ZipFolderPath)) {
    New-Item -Path $ZipFolderPath -ItemType Directory
}

# Compress files to a ZIP archive
Compress-Archive -Path $SourceFolder -DestinationPath $ZipPath -Force

# Define function to move the ZIP file
function Move-ZipFile {
    param(
        [string]$SourcePath,
        [string]$DestinationPath
    )

    if (Test-Path $SourcePath) {
        Move-Item -Path $SourcePath -Destination $DestinationPath
    }
}

# Attempt to move the ZIP file
Move-ZipFile -SourcePath $ZipPath -DestinationPath $DestinationFolder

# Check if the move was successful, if not, retry every two hours
while (-not (Test-Path (Join-Path -Path $DestinationFolder -ChildPath $ZipFileName))) {
    Write-Host "Move failed. Retrying in 2 hours..."
    Start-Sleep -Seconds 7200
    Move-ZipFile -SourcePath $ZipPath -DestinationPath $DestinationFolder
}
