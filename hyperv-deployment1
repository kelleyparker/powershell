$vmNames = 'vm1','vm2','vm3','vm4','vm5','vm6','vm7','vm8','vm9','vm10'
$vhdsize = 80GB
$ISOpath = "D:\ISOS\ws2022.iso"
foreach ($vm in $vmNames) { New-VM -Name $vm -MemoryStartupBytes 4GB -NewVHDPath D:\VMs\$vm\$vm.vhdx -NewVHDSizeBytes $vhdsize }
foreach ($vm in $vmNames) { Add-VMDvdDrive -VMName $vm -Path $ISOpath }
foreach ($vm in $vmNames) { Set-VMFirmware -VMName $vm -FirstBootDevice ((Get-VMFirmware -VMName $vm).BootOrder |
Where-Object Device -like *DvD*).Device }
foreach ($vm in $vmNames) { Start-VM $vm } 
