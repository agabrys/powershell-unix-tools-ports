<#
PowerShell Unix Tools Ports
https://github.com/agabrys/powershell-unix-tools-ports

Copyright (c) 2018 Adam Gabryś

This file is licensed under the BSD 2-Clause (the "License").
You may not use this file except in compliance with the License.
You may obtain:
 - a copy of the License at project page
 - a template of the License at https://opensource.org/licenses/BSD-2-Clause
#>
function base64
{
<#
.SYNOPSIS
Encodes/Decodes binary file as RFC 1341 MIME base64.

.DESCRIPTION
The MIME (Multipurpose Internet Mail Extensions) specification (RFC 1341
and successors) defines a mechanism for encoding arbitrary binary information
for transmission by electronic mail. Triplets of 8-bit octets are encoded as
groups of four characters, each representing 6 bits of the source 24 bits.
Only characters present in all variants of ASCII and EBCDIC are used, avoiding
incompatibilities in other forms of encoding such as uuencode/uudecode.

.PARAMETER decode
Decodes the input, previously created by base64, to recover the original input file.
.PARAMETER encode 
Encodes the input into an output text file containing its base64 encoding.
.PARAMETER infile
Path to file which will be encoded/decoded.
.PARAMETER outfile
Path to file where the encoding/decoding results will be saved.
.PARAMETER help
Displays detailed help and exit.
.PARAMETER version
Output version information and exit.

.EXAMPLE
base64 secret.txt
cwBlAGMAcgBlAHQAIAB0AGUAeAB0AA==
.EXAMPLE
base64 secret.txt out.txt; base64 -d out.txt
secret text

.NOTES
Author: Adam Gabrys
Version: 1.0.0

Changelog:
1.0.0:
  * Allowed encoding and decoding files
  * Added switches -help and -version
#>
Param(
    [Parameter(ParameterSetName="encode")]
        [Switch]$encode,
    [Parameter(ParameterSetName="decode",Mandatory=$true)]
        [Switch]$decode,
    [Parameter(ParameterSetName="encode",Mandatory=$true,Position=0)]
    [Parameter(ParameterSetName="decode",Mandatory=$true,Position=0)]
        [String]$infile,
    [Parameter(ParameterSetName="encode",Position=1)]
    [Parameter(ParameterSetName="decode",Position=1)]
        [String]$outfile,
    [Parameter(ParameterSetName="help",Mandatory=$true)]
        [Switch]$help,
    [Parameter(ParameterSetName="version",Mandatory=$true)]
        [Switch]$version
)
    If ($help)
    {
        Get-Help -Name base64 -Detailed
        return
    }
    If ($version)
    {
        Write-Host -Object 1.0.0
        return
    }

    $intext = Get-Content -Path $infile -Raw
    $outtext = ''
    If ($decode)
    {
        $bytes = [System.Convert]::FromBase64String($intext)
        $outtext = [System.Text.Encoding]::Unicode.GetString($bytes)
    }
    Else
    {
        $bytes = [System.Text.Encoding]::Unicode.GetBytes($intext)
        $outtext = [System.Convert]::ToBase64String($bytes)
    }
    If ($outfile)
    {
        Set-Content -Value $outtext -Path $outfile -NoNewline
    }
    Else
    {
        return $outtext
    }
}
Export-ModuleMember -Function base64
