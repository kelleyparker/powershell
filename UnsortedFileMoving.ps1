$sourcePath = Get-Location
$destinationPath = Join-Path $sourcePath "_unsorted"

# Create the destination folder if it doesn't exist
if (!(Test-Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath | Out-Null
}

# Get all files in the current directory, excluding .dbx-vault, .ini, and .ps1 files
$files = Get-ChildItem -Path $sourcePath -File | Where-Object {
    $_.Extension -ne ".dbx-vault" -and $_.Extension -ne ".ini" -and $_.Extension -ne ".ps1" -and (-not $_.Attributes.HasFlag([System.IO.FileAttributes]::Hidden))
}

# Move the files to the destination folder
$files | Move-Item -Destination $destinationPath

Write-Host "Files moved to $destinationPath"
