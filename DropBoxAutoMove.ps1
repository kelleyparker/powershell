# Since I have a limited Dropbox quota, this script is scheduled on Task scheduler to move files from my Camera Uploads folder on dropbox on my server computer to my 10TB HDD which is synced to the cloud on Blazedrive.
# NOTE: Part of the destination Directory is redacted as it included personal information.

$sourceDirectory = $PSScriptRoot
$destinationDirectory = "E:\[REDACTED}\Pictures Video Mega Archive\2023_"

$extensions = @("*.jpg", "*.png", "*.mp4", "*.m4a")

$files = Get-ChildItem -Path $sourceDirectory -File -Include $extensions -Recurse

foreach ($file in $files) {
    $destinationPath = Join-Path -Path $destinationDirectory -ChildPath $file.Name
    Move-Item -Path $file.FullName -Destination $destinationPath -Force
}
