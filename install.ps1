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
$_psUnixToolsPortsDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$_psUnixToolsPortsImportScript = "$_psUnixToolsPortsDirectory\import.psm1"
$_psUnixToolsPortsImportCommand = "Import-Module -Name $_psUnixToolsPortsImportScript"
$_psUnixToolsPortsImportCommandWithComments = "#PowerShell Unix Tools Ports: Start`r`nImport-Module -Name $_psUnixToolsPortsImportScript`r`n#PowerShell Unix Tools Ports: End`r`n"

If (!(Test-Path -Path $profile))
{
    Write-Host "User profile does not exist, creating a new one..."
    $_psUnixToolsPortsUserProfileFile = (New-Item -Path $profile -ItemType "file" -Force -Value $_psUnixToolsPortsImportCommandWithComments).FullName
    Write-Host "User profile has been created: $_psUnixToolsPortsUserProfileFile"
    Write-Host -ForegroundColor Green "PowerShell Unix Tools Ports have been installed"
    Import-Module -Name $_psUnixToolsPortsImportScript
}
ElseIf (@(Get-Content -Path $profile | Where-Object { $_.Contains("$_psUnixToolsPortsImportScript") }).Count -gt 0)
{
    Write-Host -ForegroundColor Green "PowerShell Unix Tools Ports is already installed"
}
Else
{
    Write-Host "User profile does exist, adding import to PowerShell Unix Tools Ports..."
    Add-Content -Path $profile -Value "`r`n$_psUnixToolsPortsImportCommandWithComments"
    Write-Host -ForegroundColor Green "PowerShell Unix Tools Ports have been installed"
    Import-Module -Name $_psUnixToolsPortsImportScript
}
