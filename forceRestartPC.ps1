 $computername = Read-Host -prompt "Enter the name of the remote computer that you would like to reboot."
 Restart-Computer -computername $computername -force
