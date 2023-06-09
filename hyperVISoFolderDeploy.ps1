# Set variables
$MemoryStartupBytes = 2GB
$NewVHDSizeBytes = 40GB
$ISOPath = "D:\isos"
$VMPath = "D:\VMs"

# Loop through each ISO and create a VM
Get-ChildItem $ISOPath -Filter *.iso | ForEach-Object {
    $iso = $_
    # Set VM name
    $VMName = $iso.BaseName.Replace("_VM", "")
    # Set new VHD path
    $NewVHDPath = Join-Path -Path $VMPath -ChildPath "$VMName.vhdx"

    # Create new VM
    New-VM -Name $VMName -MemoryStartupBytes $MemoryStartupBytes -Path $VMPath

    # Create new virtual hard disk
    New-VHD -Path $NewVHDPath -SizeBytes $NewVHDSizeBytes -Dynamic

    # Attach virtual hard disk to VM
    Add-VMHardDiskDrive -VMName $VMName -Path $NewVHDPath

    # Set network adapter for VM
    Add-VMNetworkAdapter -VMName $VMName -SwitchName "Default Switch"

    # Find the appropriate ISO file based on the VM name
    $ISOName = "$VMName.iso"
    $ISOPathWithName = Join-Path $ISOPath $ISOName

    # Set DVD drive to the appropriate ISO file
    if(Test-Path $ISOPathWithName) {
        Set-VMDvdDrive -VMName $VMName -Path $ISOPathWithName -Confirm:$false
    }
    else {
        Write-Warning "ISO file not found: $ISOPathWithName"
    }
}

# Start all virtual machines
Get-VM | ForEach-Object {
    $VM = $_
    Start-VM -VMName $VM.Name
}
