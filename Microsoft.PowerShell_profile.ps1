function Edit-Profile{
   Notepad $profile
}
Set-Alias epf Edit-ProfileFile

function dev {
   Set-Location "C:\Users\Bastian Ballmann\Documents\develop"
}

function showme {
  param (
        [Parameter(Mandatory=$true)]
        [string]$Name
  )

   Get-Help $Name -Examples
}

function tail-f {
  param (
        [Parameter(Mandatory=$true)]
        [string]$Name
  )
  Get-Content -Tail 10 -Wait $name
}

function ls-altr { 
  Get-ChildItem | Sort-Object LastWriteTime
}

function touch {
  param (
        [Parameter(Mandatory=$true)]
        [string]$Name
  )
  Add-Content -Path $Name -Value ""
}

#Set-Alias grep -Value Select-String

function grep {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [Parameter(ValueFromPipeline=$true)]
        $InputObject
    )

    process {
        $InputObject | findstr /s $Name
    }
}

Set-Alias less -Value more

function suspend {
  C:\Windows\System32\rundll32.exe powrprof.dll,SetSuspendState Standby
}