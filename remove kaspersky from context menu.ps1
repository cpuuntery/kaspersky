$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved"
$BlockedPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked"

# Get all items under the registry path
$items = Get-ItemProperty -Path $registryPath

# Loop through each item and print the name and value
foreach ($item in $items.PSObject.Properties) {
    if ($item.Value -like "*Scan*") {
		Set-ItemProperty -Path $BlockedPath -Name $item.Name -Value "" -Force | Out-Null
    }
}

stop-process -name explorer –force


