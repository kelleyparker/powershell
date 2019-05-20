# SCRIPT CURRENTLY UNDER DEPLOYMENT - DO NOT USE ON YOUR OWN PC AT HOME.  I AM ABSOLUTELY **NOT** RESPONSIBLE FOR ANY LOSS ACCRUED FROM USAGE OF THIS POWERSHELL SCRIPT!

# Run this command after deploying own Windows 10 PC at home.  All commands requiring personal information will be inputted for privacy reasons.
# 1) Name the computer.
#    $newcomputername = Read-Host "What do you want your new computer name to be?"
#    Rename-Computer -newname $newcomputername
#    END
# 2) Turn on allow remote desktop connection
#    Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" –Value 0
#    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
#    END
# 3) Set DNS servers to Google ("8.8.8.8","8.8.4.4")
#    $DNS1 = Read-Host "What do you want your primary DNS address to be?"
#    $DNS2 = Read-Host "What do you want your secondary DNS address to be?"
#    Set-DnsClientServerAddress -InterfaceAlias Ethernet ("$DNS1","$DNS2")
#    END
# 4) Modify registry MSTSC default port number if necessary
#    $mstscportnumber = Read-Host "What do you want your RDP listening port to be? If you don't want to change this, type in 3389 and press enter."
#    Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name PortNumber | Select-Object PortNumber
#    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name PortNumber -Value $mstscportnumber
#    New-NetFirewallRule -DisplayName "Remote Desktop - USer Mode (TCP-In) $mstscportnumber" - Direction Inbound -Protocol TCP -Profile Any -LocalPort $mstscportnumber -Action allow
#    New-NetFirewallRule -DisplayName "Remote Desktop - USer Mode (UDP-In) $mstscportnumber" - Direction Inbound -Protocol UDP -Profile Any -LocalPort $mstscportnumber -Action allow
#    END
# 5) Enable auto login upon reboot (for netplwiz)
#    $RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
#    $DefaultUsername = Read-Host "What is the username with which you want to use for auto-login?"
#    $DefaultPassword = Read-Host "What is the password with which you want to use for auto-login?"
#    Set-ItemProperty $RegPath "AutoAdminLogon" -Value "1" -type String 
#    Set-ItemProperty $RegPath "DefaultUsername" -Value "$DefaultUsername" -type String 
#    Set-ItemProperty $RegPath "DefaultPassword" -Value "$DefaultPassword" -type String
#    END
# 6) join domain (optional, be sure to uncomment)
#    $domainname = Read-Host "What do you want your domain name to be?"
#    add-computer -computername $newcomputername -domainname $domainname
# 7) 
# 8) 
# 9) Final Step: Reboot PC 
#    Restart-Computer -force
