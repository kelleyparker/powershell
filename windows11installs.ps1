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

# Install Steam silently
if (Test-Path -Path $steamInstallDir) {
    Write-Output "Steam is already installed"
}
else {
    Invoke-WebRequest -Uri $steamUrl -OutFile "$env:TEMP\SteamSetup.exe"
    Start-Process -FilePath "$env:TEMP\SteamSetup.exe" -ArgumentList "/S", "/D=`"$steamInstallDir`"" -Wait
}

# Install Firefox silently
if (Test-Path -Path $firefoxInstallDir) {
    Write-Output "Firefox is already installed"
}
else {
    Invoke-WebRequest -Uri $firefoxUrl -OutFile "$env:TEMP\FirefoxSetup.exe"
    Start-Process -FilePath "$env:TEMP\FirefoxSetup.exe" -ArgumentList "/S", "/D=`"$firefoxInstallDir`"" -Wait
}

# Install Chrome silently
if (Test-Path -Path $chromeInstallDir) {
    Write-Output "Chrome is already installed"
}
else {
    Invoke-WebRequest -Uri $chromeUrl -OutFile "$env:TEMP\ChromeSetup.msi"
    Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$env:TEMP\ChromeSetup.msi`" /qn /norestart" -Wait
}

# Install Android Studio silently
if (Test-Path -Path $androidStudioInstallDir) {
    Write-Output "Android Studio is already installed"
}
else {
    Invoke-WebRequest -Uri $androidStudioUrl -OutFile "$env:TEMP\AndroidStudioSetup.exe"
    Start-Process -FilePath "$env:TEMP\AndroidStudioSetup.exe" -ArgumentList "/S", "/D=`"$androidStudioInstallDir`"" -Wait
}

# Install FL Studio silently
if (Test-Path -Path $flStudioInstallDir) {
    Write-Output "FL Studio is already installed"
}
else {
    Invoke-WebRequest -Uri $flStudioUrl -OutFile "$env:TEMP\FLStudioSetup.exe"
    Start-Process -FilePath "$env:TEMP\FLStudioSetup.exe" -ArgumentList "/S", "/D=`"$flStudioInstallDir`"" -Wait
}

# Install OBS Studio silently
if (Test-Path -Path $obsStudioInstallDir) {
    Write-Output "OBS Studio is already installed"
}
else {
    Invoke-WebRequest -Uri $obsStudioUrl -OutFile "$env:TEMP\OBSStudioSetup.exe"
    Start-Process -FilePath "$env:TEMP\OBSStudioSetup.exe" -ArgumentList "/S", "/D=`"$obsStudioInstallDir`"" -Wait
}

Write-Output "Steam, Firefox, Chrome, Android Studio, FL Studio, and OBS Studio have been installed or updated."
