$file = ".\running-processes.txt"
$good_processes = @{}

#
# Functions
#
function SendNotification {
    param(        
        [string]$Text        
    )

    Add-Type -AssemblyName System.Windows.Forms

    $notification = New-Object System.Windows.Forms.NotifyIcon
    $notification.Icon = [System.Drawing.SystemIcons]::Information
    $notification.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Info
    $notification.BalloonTipTitle = "Process Monitor Alert"
    $notification.BalloonTipText = $Text
    $notification.Visible = $true

    $notification.ShowBalloonTip(5000)
    $notification.Dispose()
}

#
# MAIN PART
#

# Read file with all known good processes and save them in a hash table
foreach ($process_name in Get-Content -Path $file) {
    $good_processes[$process_name] = $True
}

# Iterate over a uniqe list of running processes name
foreach ($process_name in Get-Process | Select-Object -ExpandProperty Name -Unique) {
    # If we dont know them as a godd proccess send a notification
    if ($good_processes.Keys -notcontains $process_name) {
        Write-Host "Unknown proccess $process_name"
        SendNotification "Unknown proccess $process_name"
    }
}
