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
$_psUnixToolsPortsToolsPaths = (Get-ChildItem "$_psUnixToolsPortsDirectory\tools" -File).FullName
ForEach ($_psUnixToolsPortsToolPath in $_psUnixToolsPortsToolsPaths)
{
    Import-Module -Name $_psUnixToolsPortsToolPath
}
