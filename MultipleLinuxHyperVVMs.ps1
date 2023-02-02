# File best for creating multiple VMs with linux as secure boot is disabled

Get-Command -Module Hyper-V

$VMName = "server1","server2","server3","server4"

$ISOpath = "E:\ISOs\fedora37server.iso"

$VMLOC = "J:\test" 

Remove-Item -path $VMLOC -Recurse



$VMNet = "Home External Switch"

Foreach($vm in $VMName) { New-VM -Name $VM -Generation 2 -SwitchName $VMNet
New-VHD -Path "$VMLOC\$VM\$vm.vhdx" -Dynamic -SizeBytes 100GB
ADD-VMHardDiskDrive -VMName $vm -Path "$VMLOC\$VM\$vm.vhdx"
Set-VM $VM -MemoryStartupBytes 1GB
Add-VMDvdDrive -VMName $vm -Path $ISOpath
Set-VMFirmware -VMName $vm -FirstBootDevice ((Get-VMFirmware -VMName $vm).BootOrder |
Where-Object Device -like *DvD*).Device -EnableSecureBoot Off
Set-VMMemory -VMName $vm -MaximumBytes 4GB

}

Start-VM -Name $VMName

