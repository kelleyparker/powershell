# Array of TCP destination ports to open
$tcpPorts = @(80, 443, 1119..1120, 3074, 3724, 4000, 6112..6114, 7500..7509, 30000..30009)

# Array of UDP destination ports to open
$udpPorts = @(80, 443, 1119..1120, 3074, 3097..3196, 3724, 4000, 6112..6114, 27015..27200)

# Define the Windows Firewall rule name
$ruleName = "Destiny2_Open_NAT_Rule"

# Loop through TCP ports and create firewall rules
foreach ($port in $tcpPorts) {
    New-NetFirewallRule -DisplayName "$ruleName - TCP $port" -Direction Inbound -Protocol TCP -LocalPort $port -Action Allow
}

# Loop through UDP ports and create firewall rules
foreach ($port in $udpPorts) {
    New-NetFirewallRule -DisplayName "$ruleName - UDP $port" -Direction Inbound -Protocol UDP -LocalPort $port -Action Allow
}

Write-Host "Firewall rules for Destiny 2 ports have been created."
