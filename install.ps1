<#
PowerShell Unix Tools Ports
https://github.com/agabrys/powershell-unix-tools-ports

Copyright (c) 2017 Adam Gabryś

This file is licensed under the BSD 2-Clause (the "License").
You may not use this file except in compliance with the License.
You may obtain:
 - a copy of the License at project page
 - a template of the License at https://opensource.org/licenses/BSD-2-Clause
#>
$private:directory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$private:importScript = "$directory\import.psm1"
$private:importCommand = @"
#PowerShell Unix Tools Ports: Start
`$private:powershellUnixToolsPortsImportScript = @'
$importScript
'@
if (Test-Path -Path `$powershellUnixToolsPortsImportScript) {
    Import-Module -Name `$powershellUnixToolsPortsImportScript
} else {
    Write-Warning -Message "PowerShell Unix Tools Ports import script does not exist: `$powershellUnixToolsPortsImportScript"
}
#PowerShell Unix Tools Ports: End
"@

If (!(Test-Path -Path $profile))
{
    Write-Host -Object "User profile does not exist, creating a new one..."
    $private:userProfileFile = (New-Item -Path $profile -ItemType "file" -Force -Value $importCommand).FullName
    Write-Host -Object "User profile has been created: $userProfileFile"
    Write-Host -ForegroundColor Green -Object "PowerShell Unix Tools Ports have been installed"
    Import-Module -Name $importScript
}
ElseIf (@(Get-Content -Path $profile | Where-Object -FilterScript { $_.Contains("$importScript") }).Count -gt 0)
{
    Write-Host -ForegroundColor Green -Object "PowerShell Unix Tools Ports is already installed"
}
Else
{
    Write-Host -Object "User profile does exist, adding import to PowerShell Unix Tools Ports..."
    Add-Content -Path $profile -Value "`r`n$importCommand"
    Write-Host -ForegroundColor Green -Object "PowerShell Unix Tools Ports have been installed"
    Import-Module -Name $importScript
}
