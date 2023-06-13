# WARNING - may not uninstall all programs, still testing.

$programs = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -notlike "*Microsoft Edge*"}

foreach ($program in $programs) {
    Write-Output "Uninstalling $($program.Name)..."
    $program.Uninstall()
    Write-Output "$($program.Name) uninstalled successfully!"
}
