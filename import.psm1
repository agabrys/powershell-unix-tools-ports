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
$drectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$tools = (Get-ChildItem -Path "$drectory\tools" -File).FullName
ForEach ($tool in $tools)
{
    Import-Module -Name $tool
}
