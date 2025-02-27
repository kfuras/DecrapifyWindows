function Log() {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)] [String] $message
    )

    $ts = Get-Date -f "yyyy/MM/dd hh:mm:ss tt"
    Write-Output "$ts $message"
}

# Start logging in the same folder as the script
Start-Transcript "$($PSScriptRoot)\Decrapify.log" -Append

# Load the Config.xml
$ScriptFolder = "$PSScriptRoot\"
Log "Script folder: $ScriptFolder"
Log "Loading configuration: $($ScriptFolder)Config.xml"

[Xml]$config = Get-Content "$($ScriptFolder)Config.xml"

# Remove specified apps if they exist
Log "Removing specified apps"
$apps = Get-AppxPackage -AllUsers  # Ensure we're getting all installed apps

foreach ($app in $config.Config.RemoveApps.App) {
    Log "Checking for app: $app"

    $foundApps = $apps | Where-Object { $_.Name -eq $app }

    if ($foundApps) {
        foreach ($foundApp in $foundApps) {
            try {
                Log "Removing app: $app"
                Get-AppxPackage -AllUsers -Name $app | Remove-AppxPackage -ErrorAction SilentlyContinue | Out-Null
            } catch {
                Log "Error removing app: $app - $_"
            }
        }
    } else {
        Log "App not found: $app"
    }
}

Stop-Transcript