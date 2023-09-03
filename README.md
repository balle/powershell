# What's in here?

My Powershell profile and some maybe useful scripts

# Process monitor

To use the process monitor first generate a file running-proceses.txt in the same
folder that contains process names of all processes that you normally run.

``Get-Process | Select-Object -ExpandProperty Name -Unique | Sort-Object > .\Documents\develop\powershell\running-processes.txt``

To run the process monitor every minute add a scheduler job

```
$trigger = New-JobTrigger -AtStartup -RandomDelay (New-TimeSpan -Seconds (Get-Random -Minimum 30 -Maximum 60))
Register-ScheduledJob -Name 'Process Monitor' -FilePath 'C:\Path\to\process_monitor.ps1' -Trigger $trigger
```
