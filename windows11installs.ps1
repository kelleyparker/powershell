function InstallSoftware($url, $installDir, $displayName) {
    if (Test-Path -Path $installDir) {
        Write-Output "$displayName is already installed"
    }
    else {
        Write-Output "Installing $displayName..."
        $downloadPath = Join-Path $env:TEMP (Split-Path -Leaf $url)
        Invoke-WebRequest -Uri $url -OutFile $downloadPath

        if ($url -like "*.msi") {
            Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$downloadPath`" /qn /norestart" -Wait
        }
        elseif ($displayName -eq "Audacity") {
           $exeArguments = "/VERYSILENT /NORESTART"
            Start-Process -FilePath $downloadPath -ArgumentList $exeArguments -Wait
        }
        elseif ($displayName -eq "Docker Desktop") {
            $exeArguments = "--quiet", "--accept-license", "--installation-dir=C:\Program Files\Docker\Docker"
            Start-Process -FilePath $downloadPath -ArgumentList $exeArguments -Wait
        }
        else {
            Start-Process -FilePath $downloadPath -ArgumentList "/S", "/D=`"$installDir`"" -Wait
        }

        if (Test-Path -Path $installDir) {
            Write-Output "Install of $displayName succeeded!"
        }
        else {
            Write-Output "Install of $displayName failed!"
        }
    }
}

# Define the URLs and installation directories for each software
$softwareList = @(
    @{
        "Url" = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
        "InstallDir" = "C:\Program Files\Android\Android Studio Canary 7 Hedgehog 2023.1.1 "
        "DisplayName" = "Steam"
    },
    @{
        "Url" = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
        "InstallDir" = "C:\Program Files\Steam"
        "DisplayName" = "Steam"
    },
    @{
        "Url" = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/114.0.1/win64/en-US/Firefox%20Setup%20114.0.1.exe"
        "InstallDir" = "C:\Program Files\Mozilla Firefox"
        "DisplayName" = "Firefox"
    },
    @{
        "Url" = "https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi"
        "InstallDir" = "C:\Program Files\Google\Chrome"
        "DisplayName" = "Chrome web browser"
    },
    @{
        "Url" = "https://redirector.gvt1.com/edgedl/android/studio/install/2020.3.1.22/android-studio-2020.3.1.22-windows.exe"
        "InstallDir" = "C:\Program Files\Android\Android Studio"
        "DisplayName" = "Android Studio"
    },
    @{
        "Url" = "https://download.oracle.com/java/20/latest/jdk-20_windows-x64_bin.msi"
        "InstallDir" = "C:\Program Files\Java\jdk"
        "DisplayName" = "Java SDK 20"
    },
    @{
        "Url" = "https://demodownload.image-line.com/flstudio/flstudio_win64_21.0.3.3517.exe"
        "InstallDir" = "C:\Program Files (x86)\Image-Line\FL Studio 20"
        "DisplayName" = "FL Studio 21"
    },
    @{
        "Url" = "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-29.1.2-Full-Installer-x64.exe"
        "InstallDir" = "C:\Program Files\obs-studio"
        "DisplayName" = "OBS Studio"
    },
    @{
        "Url" = "https://www.7-zip.org/a/7z2300-x64.exe"
        "InstallDir" = "C:\Program Files\7-Zip"
        "DisplayName" = "7-Zip"
    },
    @{
        "Url" = "https://github.com/audacity/audacity/releases/download/Audacity-3.3.3/audacity-win-3.3.3-x64.exe"
        "InstallDir" = "C:\Program Files\Audacity"
        "DisplayName" = "Audacity"
    },
    @{
        "Url" = "https://awscli.amazonaws.com/AWSCLIV2.msi"
        "InstallDir" = "C:\Program Files\Amazon\AWSCLI"
        "DisplayName" = "AWS Command Line Interface (CLI)"
    },
    @{
        "Url" = "https://www.wireshark.org/download/win64/all-versions/Wireshark-win64-3.4.7.exe"
        "InstallDir" = "C:\Program Files\Wireshark"
        "DisplayName" = "Wireshark"
    },
    @{
        "Url" = "https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe"
        "InstallDir" = "C:\Program Files\Python39"
        "DisplayName" = "Python"
    },
    @{
        "Url" = "https://download.teamviewer.com/download/TeamViewer_Setup.exe"
        "InstallDir" = "C:\Program Files\TeamViewer"
        "DisplayName" = "TeamViewer"
    },
    @{
        "Url" = "https://edge.elgato.com/egc/windows/eccw/1.4.2/ControlCenter_1.4.2.67_x64.msi"
        "InstallDir" = "C:\Program Files\Elgato\Control Center"
        "DisplayName" = "Elgato Control Center"
    }
    @{
        "Url" = "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe"
        "InstallDir" = "C:\Program Files\Docker Desktop"
        "DisplayName" = "Docker Desktop"
    }
)

foreach ($software in $softwareList) {
    InstallSoftware -url $software.Url -installDir $software.InstallDir -displayName $software.DisplayName
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
