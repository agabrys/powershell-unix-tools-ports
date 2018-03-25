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
$script:directory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$script:emptyDir = "$directory/../tmp/empty"
If (!(Test-Path -Path $emptyDir))
{
    New-Item -ItemType directory -Path $emptyDir
}

function rmdir2
{
<#
.SYNOPSIS
Removes directories (empty and non-empty)

.DESCRIPTION
Removes directories, no matter if they are empty or not.

.PARAMETER path
Path of directories which will be removed.
.PARAMETER help
Displays detailed help and exit.
.PARAMETER version
Output version information and exit.

.EXAMPLE
rmdir2 directory
.EXAMPLE
rmdir2 dire??ory
.EXAMPLE
rmdir2 *

.NOTES
Author: Adam Gabrys
Version: 1.0.0

Changelog:
1.0.0:
  * Allowed removal of empty and non-empty directories
  * Added switches -help and -version
#>
Param(
    [Parameter(ParameterSetName="path",Mandatory=$true,Position=0)]
        [String]$path,
    [Parameter(ParameterSetName="help",Mandatory=$true)]
        [Switch]$help,
    [Parameter(ParameterSetName="version",Mandatory=$true)]
        [Switch]$version
)

    If ($help)
    {
        Get-Help -Name rmdir2 -Detailed
        return
    }
    If ($version)
    {
        Write-Host -Object 1.0.0
        return
    }

    $items = Get-Item -Path $path
    ForEach ($item in $items)
    {
        If ($item -is [System.IO.DirectoryInfo])
        {
            $fullName = $item.FullName
            robocopy $emptyDir $fullName /PURGE /XD | Out-Null
            Remove-Item -Path $fullName
            Write-Verbose -Message "`"$fullName`" has been removed"
        }
    }
}
Export-ModuleMember -Function rmdir2
