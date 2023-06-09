#Installs latest versions of Firefox, Chrome, Steam, on Windows 11 - should work on Windows 10 as well

# Define the URLs and installation directories for Steam, Firefox, and Chrome
$steamUrls = @(
    "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
)
$steamInstallDir = "C:\Program Files\Steam"
$firefoxUrl = "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
$firefoxInstallDir = "C:\Program Files\Mozilla Firefox"
$chromeUrl = "https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi"
$chromeInstallDir = "C:\Program Files\Google\Chrome"

# Check if Steam is already installed
if (Test-Path -Path $steamInstallDir) {
    Write-Host "Steam is already installed"
}
else {
    # Loop through the Steam URLs and download the Steam installer to a temporary directory
    $tempDir = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "SoftwareInstall")
    if (!(Test-Path -Path $tempDir)) {
        New-Item -ItemType Directory -Path $tempDir | Out-Null
    }
    foreach ($url in $steamUrls) {
        $fileName = [System.IO.Path]::GetFileName($url)
        $tempFile = [System.IO.Path]::Combine($tempDir, $fileName)
        $wc = New-Object System.Net.WebClient
        $wc.DownloadFile($url, $tempFile)
    }

    # Install Steam silently
    $arguments = @(
        "/S",
        "/D=`"$steamInstallDir`""
    )
    try {
        Start-Process -FilePath $tempFile -ArgumentList $arguments -Wait
        Write-Host "Successfully installed Steam"
    }
    catch {
        Write-Host "Failed to install Steam"
        Write-Host $Error[0].Exception.Message
    }

    # Clean up the temporary directory
    Remove-Item -Path $tempDir -Recurse -Force
}

# Check if Firefox is already installed
if (Test-Path -Path $firefoxInstallDir) {
    Write-Host "Firefox is already installed"
}
else {
    # Download and install Firefox silently
    $tempFile = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "FirefoxSetup.exe")
    $wc = New-Object System.Net.WebClient
    $wc.DownloadFile($firefoxUrl, $tempFile)
    $arguments = @(
        "/S",
        "/D=`"$firefoxInstallDir`""
    )
    try {
        Start-Process -FilePath $tempFile -ArgumentList $arguments -Wait
        Write-Host "Successfully installed Firefox"
    }
    catch {
        Write-Host "Failed to install Firefox"
        Write-Host $Error[0].Exception.Message
    }
}

# Check if Chrome is already installed
if (Test-Path -Path $chromeInstallDir) {
    Write-Host "Chrome is already installed"
}
else {
    # Download and install Chrome silently
    $tempFile = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "ChromeSetup.msi")
    $wc = New-Object System.Net.WebClient
    $wc.DownloadFile($chromeUrl, $tempFile)
    $arguments = @(
        "/qn",
        "/I `"$tempFile`""
    )
    try {
        Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait
        Write-Host "Successfully installed Chrome"
    }
    catch {
        Write-Host "Failed to install Chrome"
        Write-Host $Error[0].Exception.Message
    }
}
