Get-ChildItem -File | Where-Object { $_.Extension -ne '.ps1' -and $_.Name -notlike 'readme.ps1' -and $_.Name -notlike 'readme.*' } | ForEach-Object {
    $newName = $_.BaseName + '.ps1'
    Rename-Item $_.FullName -NewName $newName
}
