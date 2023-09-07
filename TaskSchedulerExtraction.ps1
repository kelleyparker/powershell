$author = "Kelley Parker"
$destinationFolder = Join-Path -Path $PSScriptRoot -ChildPath "KelleyParkerTasks"

# Create the destination folder if it doesn't exist
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# Get all tasks from Task Scheduler
$tasks = Get-ScheduledTask

# Filter tasks where the author matches the specified value
$filteredTasks = $tasks | Where-Object { $_.Principal.UserId -eq $author }

# Export each filtered task to the destination folder
foreach ($task in $filteredTasks) {
    $taskName = $task.TaskName
    $destinationPath = Join-Path -Path $destinationFolder -ChildPath "$taskName.xml"
    Export-ScheduledTask -TaskName $taskName -TaskPath "\" -Xml | Out-File -FilePath $destinationPath -Encoding UTF8
}

Write-Host "Tasks exported to: $destinationFolder"
