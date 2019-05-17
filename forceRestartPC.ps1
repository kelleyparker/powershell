 $computername = Read-Host "Enter the name of the remote computer that you would like to reboot."
 Restart-Computer -computername $computername -force
