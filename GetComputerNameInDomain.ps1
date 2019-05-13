$computername = Read-Host 'What is the computer name you would like to check?'
Get-Process -ComputerName $computername
