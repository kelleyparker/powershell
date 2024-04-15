$switchName = Read-Host "Enter the name of the switch you want to use. The switch name must already currently exist in Virtual Switch Manager"

Get-VM | Get-VMNetworkAdapter | Where-Object {$_.SwitchName -ne $switchName} | Set-VMNetworkAdapter -Passthru | Connect-VMNetworkAdapter -SwitchName $switchName
