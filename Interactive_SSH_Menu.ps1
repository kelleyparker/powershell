# Interactive SSH Server Menu that maps to a PEM file

# Define your SSH parameters
$PemFile = "[location of pem file, full path]"
$User = "[USER_NAME]"

# Define the server details
$Servers = @(
    @{ Name = "[SERVER NAME"; IP = "[IP_ADDRESS" },
    @{ Name = "[SERVER NAME"; IP = "[IP_ADDRESS" },
    @{ Name = "[SERVER NAME"; IP = "[IP_ADDRESS" }
)

# Display menu
do {
    Write-Host "Select a server to SSH into:"
    for ($i = 0; $i -lt $Servers.Count; $i++) {
        Write-Host "$($i + 1). $($Servers[$i].Name)"
    }

    $choice = Read-Host "Enter the number (1-##) or 'q' to quit"

    if ($choice -eq 'q') {
        Write-Host "Exiting script."
        Exit
    }

    $index = [int]$choice - 1

    if ($index -ge 0 -and $index -lt $Servers.Count) {
        $selectedServer = $Servers[$index]
        $SSHCommand = "ssh -i `"$PemFile`" $User@$($selectedServer.IP)"
        Invoke-Expression -Command $SSHCommand
    }
    else {
        Write-Host "Invalid selection. Please enter a number between 1 and [THE_MAX_NUMBER_OF_SERVERS] or 'q' to quit."
    }

} while ($true)
