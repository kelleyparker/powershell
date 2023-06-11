# NOTE: Double if a download fails, double-check to be sure the URLs are still valid.  Generated with chatGPT gpt3 and Sage (Quora/Poe)
# Define the URLs and installation directories for Steam, Firefox, Chrome, Android Studio, FL Studio, and OBS Studio
$steamUrl = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
$steamInstallDir = "C:\Program Files\Steam"
$firefoxUrl = "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
$firefoxInstallDir = "C:\Program Files\Mozilla Firefox"
$chromeUrl = "https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi"
$chromeInstallDir = "C:\Program Files\Google\Chrome"
$androidStudioUrl = "https://redirector.gvt1.com/edgedl/android/studio/install/2020.3.1.22/android-studio-2020.3.1.22-windows.exe"
$androidStudioInstallDir = "C:\Program Files\Android\Android Studio"
$flStudioUrl = "https://demodownload.image-line.com/flstudio/flstudio_win64_21.0.3.3517.exe"
$flStudioInstallDir = "C:\Program Files (x86)\Image-Line\FL Studio 20"
$obsStudioUrl = "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-27.0.1-Full-Installer-x64.exe"
$obsStudioInstallDir = "C:\Program Files\obs-studio"

$sevenZipUrl = "https://www.7-zip.org/a/7z2300-x64.exe"
$sevenZipInstallDir = "C:\Program Files\7-Zip"

$audacityUrl = "https://github.com/audacity/audacity/releases/download/Audacity-3.3.3/audacity-win-3.3.3-x64.exe"
$audacityInstallDir = "C:\Program Files\Audacity"

$awsCliUrl = "https://awscli.amazonaws.com/AWSCLIV2.msi"
$awsCliInstallDir = "C:\Program Files\AWSCLI"

$elgatoControlCenterUrl = "https://edge.elgato.com/egc/windows/eccw/1.4.2/ControlCenter_1.4.2.67_x64.msi"
$elgatoControlCenterInstallDir = "C:\Program Files\Elgato\Control Center"

$elgatoWaveLinkUrl = "https://edge.elgato.com/egc/windows/wavelink/1.7.1/WaveLink_1.7.1.3057_x64.msi"
$elgatoWaveLinkInstallDir = "C:\Program Files\Elgato\Wave Link"

$epicGamesLauncherUrl = "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"
$epicGamesLauncherInstallDir = "C:\Program Files\Epic Games Launcher"

$everythingUrl = "https://www.voidtools.com/Everything-1.4.1.1024.x64-Setup.exe"
$everythingInstallDir = "C:\Program Files\Everything"




# Install Steam silently
if (Test-Path -Path $steamInstallDir) {
    Write-Output "Steam is already installed"
}
else {
    Write-Output "Installing Steam..."
    Invoke-WebRequest -Uri $steamUrl -OutFile "$env:TEMP\SteamSetup.exe"
    Start-Process -FilePath "$env:TEMP\SteamSetup.exe" -ArgumentList "/S", "/D=`"$steamInstallDir`"" -Wait
}

# Install Firefox silently
if (Test-Path -Path $firefoxInstallDir) {
    Write-Output "Firefox is already installed"
}
else {
    Write-Output "Installing Firefox..."
    Invoke-WebRequest -Uri $firefoxUrl -OutFile "$env:TEMP\FirefoxSetup.exe"
    Start-Process -FilePath "$env:TEMP\FirefoxSetup.exe" -ArgumentList "/S", "/D=`"$firefoxInstallDir`"" -Wait
}

# Install Chrome silently
if (Test-Path -Path $chromeInstallDir) {
    Write-Output "Chrome is already installed"
}
else {
    Write-Output "Installing Chrome web browser..."
    Invoke-WebRequest -Uri $chromeUrl -OutFile "$env:TEMP\ChromeSetup.msi"
    Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$env:TEMP\ChromeSetup.msi`" /qn /norestart" -Wait
}

# Install Android Studio silently
if (Test-Path -Path $androidStudioInstallDir) {
    Write-Output "Android Studio is already installed"
}
else {
    Write-Output "Installing Android studio..."
    Invoke-WebRequest -Uri $androidStudioUrl -OutFile "$env:TEMP\AndroidStudioSetup.exe"
    Start-Process -FilePath "$env:TEMP\AndroidStudioSetup.exe" -ArgumentList "/S", "/D=`"$androidStudioInstallDir`"" -Wait
}

# Install FL Studio silently
if (Test-Path -Path $flStudioInstallDir) {
    Write-Output "FL Studio is already installed"
}
else {
    Write-Output "Installing FL Studio 21..."
    Invoke-WebRequest -Uri $flStudioUrl -OutFile "$env:TEMP\FLStudioSetup.exe"
    Start-Process -FilePath "$env:TEMP\FLStudioSetup.exe" -ArgumentList "/S", "/D=`"$flStudioInstallDir`"" -Wait
}

# Install OBS Studio silently
if (Test-Path -Path $obsStudioInstallDir) {
    Write-Output "OBS Studio is already installed"
}
else {
    Write-Output "Installing OBS Studio..."
    Invoke-WebRequest -Uri $obsStudioUrl -OutFile "$env:TEMP\OBSStudioSetup.exe"
    Start-Process -FilePath "$env:TEMP\OBSStudioSetup.exe" -ArgumentList "/S", "/D=`"$obsStudioInstallDir`"" -Wait
}


# install aws cli silently
if (Test-Path -Path $awsCliInstallDir) {
    Write-Output "AWS CLI is already installed"
}
else {
    Write-Output "Installing AWS Cli..."
    Invoke-WebRequest -Uri $awsCliUrl -OutFile "$env:TEMP\AWSCLI.msi"
    Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$env:TEMP\AWSCLI.msi`" /qn /norestart" -Wait
}


# Install Elgato Control Center silently
if (Test-Path -Path $elgatoControlCenterInstallDir) {
    Write-Output "Elgato Control Center is already installed"
}
else {
    Write-Output "Installing Elgato Control Center..."
    Invoke-WebRequest -Uri $elgatoControlCenterUrl -OutFile "$env:TEMP\ElgatoControlCenterSetup.msi"
    Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$env:TEMP\ElgatoControlCenterSetup.msi`" /qn /norestart" -Wait
}

# Install Elgato Wave Link silently
if (Test-Path -Path $elgatoWaveLinkInstallDir) {
    Write-Output "Elgato Wave Link is already installed"
}
else {
    Write-Output "Installing Elgato Wave Link..."
    Invoke-WebRequest -Uri $elgatoWaveLinkUrl -OutFile "$env:TEMP\ElgatoWaveLinkSetup.msi"
    Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$env:TEMP\ElgatoWaveLinkSetup.msi`" /qn /norestart" -Wait
}

# Install Epic Games Launcher silently
if (Test-Path -Path $epicGamesLauncherInstallDir) {
    Write-Output "Epic Games Launcher is already installed"
}
else {
    Write-Output "Installing Epic Games Launcher..."
    Invoke-WebRequest -Uri $epicGamesLauncherUrl -OutFile "$env:TEMP\EpicGamesLauncherSetup.msi"
    Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$env:TEMP\EpicGamesLauncherSetup.msi`" /qn /norestart" -Wait
}

# Install Everything silently
if (Test-Path -Path $everythingInstallDir) {
    Write-Output "Everything is already installed"
}
else {
    Write-Output "Installing Everything..."
    Invoke-WebRequest -Uri $everythingUrl -OutFile "$env:TEMP\EverythingSetup.exe"
    Start-Process -FilePath "$env:TEMP\EverythingSetup.exe" -ArgumentList "/S", "/D=`"$everythingInstallDir`"" -Wait
}


# Enable optional features [during test, these lines will not work in Windows Sandbox]
$featureNames = @(
    "Containers",
    "Microsoft-Hyper-V",
    "SMB1Protocol",
    "TelnetClient",
    "TFTP",
    "Containers-DisposableClientVM",
    "VirtualMachinePlatform",
    "Microsoft-Windows-Subsystem-Linux"
)

foreach ($featureName in $featureNames) {
    Write-Output "Enabling feature: $featureName"
    Enable-WindowsOptionalFeature -Online -FeatureName $featureName -NoRestart
}
