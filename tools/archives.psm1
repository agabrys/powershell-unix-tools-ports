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
function zip
{
<#
.SYNOPSIS
Packs and compresses files.

.DESCRIPTION
Packs and compresses files. The maximum file size that you can compress is currently
2 GB. This is a limitation of the underlying API.

.PARAMETER zipfile
Path to the archive file. By default the archive file name is equal to the current
directory name with "zip" extension.
.PARAMETER files
Files which will be archived. It can contain Wildcard characters.
.PARAMETER O1
Regulate the speed of compression: the fastest speed (disabled by default).
.PARAMETER O9
Regulate the speed of compression: the slowest speed (disabled by default).
.PARAMETER help
Displays detailed help and exit.
.PARAMETER version
Output version information and exit.

.EXAMPLE
zip archive.zip file1.txt,file2.txt
.EXAMPLE
zip file1.txt,file2.txt
.EXAMPLE
zip file?.txt
.EXAMPLE
zip -zipfile archive.zip -files * -O9

.NOTES
Author: Adam Gabrys
Version: 1.0.0

Changelog:
1.0.0:
  * Allowed creation of ZIP archives
  * Added switches -help and -version
#>
Param(
    [Parameter(ParameterSetName="zipfile",Mandatory=$true,Position=0)]
        [String]$zipfile,
    [Parameter(ParameterSetName="zipfile",Mandatory=$true,Position=1)]
    [Parameter(ParameterSetName="zip",Mandatory=$true,Position=0)]
        [String[]]$files,
    [Parameter(ParameterSetName="zipfile",Mandatory=$false)]
    [Parameter(ParameterSetName="zip",Mandatory=$false)]
        [Switch]$O1,
    [Parameter(ParameterSetName="zipfile",Mandatory=$false)]
    [Parameter(ParameterSetName="zip",Mandatory=$false)]
        [Switch]$O9,
    [Parameter(ParameterSetName="help",Mandatory=$true)]
        [Switch]$help,
    [Parameter(ParameterSetName="version",Mandatory=$true)]
        [Switch]$version
)
    If ($help)
    {
        Get-Help -Name zip -Detailed
        return
    }
    If ($version)
    {
        Write-Host -Object 1.0.0
        return
    }

    $destinationPath = $zipfile
    If (!$destinationPath)
    {
        $currentDirectory = (Get-Location).Path
        $destinationPath = $currentDirectory + '/' + (Get-Item -Path $currentDirectory).Name + '.zip'
    }

    $compressionLevel = 'NoCompression'
    If ($O1)
    {
        $compressionLevel = 'Fastest'
    }
    If ($O9)
    {
        $compressionLevel = 'Optimal'
    }

    Compress-Archive -Path $files -DestinationPath $destinationPath -CompressionLevel $compressionLevel
}
Export-ModuleMember -Function zip

function unzip
{
<#
.SYNOPSIS
Extracts files from ZIP archives.

.DESCRIPTION
Extracts files from ZIP archives.

.PARAMETER zipfile
Path to the archive file. It can contain Wildcard characters.
.PARAMETER diectory
Extracts files into the specified directory rather than the current directory.
.PARAMETER help
Displays detailed help and exit.
.PARAMETER version
Output version information and exit.

.EXAMPLE
unzip archive.zip
.EXAMPLE
unzip *.zip
.EXAMPLE
unzip archive.zip destination

.NOTES
Author: Adam Gabrys
Version: 1.0.0

Changelog:
1.0.0:
  * Allowed extraction files from ZIP archives
  * Added switches -help and -version
#>
Param(
    [Parameter(ParameterSetName="zip",Mandatory=$true,Position=0)]
        [String]$zipfile,
    [Parameter(ParameterSetName="zip",Mandatory=$false,Position=1)]
        [String]$diectory,
    [Parameter(ParameterSetName="help",Mandatory=$true)]
        [Switch]$help,
    [Parameter(ParameterSetName="version",Mandatory=$true)]
        [Switch]$version
)
    If ($help)
    {
        Get-Help -Name unzip -Detailed
        return
    }
    If ($version)
    {
        Write-Host -Object 1.0.0
        return
    }

    If (!(Test-Path -Path $zipfile))
    {
        Throw 'No such file: ' + $zipfile
    }
    $destinationPath = $diectory
    If (!$destinationPath) {
        $destinationPath = Get-Location
    }

    $files = Get-Item -Path $zipfile
    ForEach ($file in $files)
    {
        Expand-Archive -Path $file -DestinationPath $destinationPath
    }
}
Export-ModuleMember -Function unzip
