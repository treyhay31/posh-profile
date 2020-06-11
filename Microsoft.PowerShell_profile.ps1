$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# tls12
# remove readline
# set exec policy
 
function gpush {
  param([string]$msg)
  git status
  git add --all
  git commit -am "$msg"
  git status
  git tag (gitversion | ConvertFrom-Json).FullSemVer
  git push origin --tags
  git push
  git status
}

function gfp {
  git fetch
  git pull
}

function Prompt {
  "$((Get-Location).Path.Split('\')[-1]) ^_^> "
}

Write-Host "

Very nice to see you!!!

PowerShell Version: $($PsVersionTable.PsVersion)

Running as $(if($isAdmin) { 'an admin!' } else { 'a non-admin... this could cause problems' })

Fun fact about the difference between & and . in powershell:
https://stackoverflow.com/questions/54661916/what-is-the-difference-between-dot-and-ampersand-in-powershell

Run this to see all you ever wanted to know about this machine:

PS> Get-ComputerInfo

"

Set-Location C:\side