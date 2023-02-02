# Changes memory in EVERY VM on a hyper-V host to a desired amount with dynamic memory enabled ($true or $false for booleans)

Get-Command -Module Hyper-V

$getvm = Get-VM 
$MaxGB = 4GB

Foreach ($vm in $getvm)
{
    Set-VMMemory $vm -DynamicMemoryEnabled $true -MaximumBytes $MaxGB
}
