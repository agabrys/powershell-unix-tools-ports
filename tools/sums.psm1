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
function md5sum
{
<#
.SYNOPSIS
Computes MD5 message digest

.DESCRIPTION
Computes and prints MD5 (128-bit) message digest.

.PARAMETER path
Path for which MD5 sum will be computed.
.PARAMETER help
Display detailed help and exit.
.PARAMETER version
Output version information and exit.

.EXAMPLE
md5sum file.txt
90cd496cff53c6382832cc9cabaae685  file.txt
.EXAMPLE
md5sum *
90cd496cff53c6382832cc9cabaae685  file.txt
d34b462e97f5f2f6f9f431c049098beb  file2.txt
a56871b7cc07d76f749c944eef039d87  file3.txt
.EXAMPLE
md5sum file?.txt
d34b462e97f5f2f6f9f431c049098beb  file2.txt
a56871b7cc07d76f749c944eef039d87  file3.txt


.NOTES
Author: Adam Gabrys
Version: 1.0.0

Changelog:
1.0.0:
  * Allowed calculation of MD5 sum
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
        Get-Help md5sum -Detailed
        return
    }
    If ($version)
    {
        Write-Host 1.0.0
        return
    }

    return _calc_sum -Path $path -Algorithm MD5
}
Export-ModuleMember -Function md5sum

function sha1sum
{
<#
.SYNOPSIS
Computes SHA1 message digest

.DESCRIPTION
Computes and prints SHA1 (160-bit) message digest.

.PARAMETER path
Path for which SHA1 sum will be computed.
.PARAMETER help
Display detailed help and exit.
.PARAMETER version
Output version information and exit.

.EXAMPLE
sha1sum file.txt
b4ba96f222b0418b27861f649ce0079a86f85cf8  file.txt
.EXAMPLE
sha1sum *
b4ba96f222b0418b27861f649ce0079a86f85cf8  file.txt
85c93ff721c5e3cbf5db2c2e2696b22bed72fbf7  file2.txt
c8892c8f2b76513ca607b66a4c3d10bb21d434ff  file3.txt
.EXAMPLE
sha1sum file?txt
85c93ff721c5e3cbf5db2c2e2696b22bed72fbf7  file2.txt
c8892c8f2b76513ca607b66a4c3d10bb21d434ff  file3.txt

.NOTES
Author: Adam Gabrys
Version: 1.0.0

Changelog:
1.0.0:
  * Allowed calculation of SHA1 sum
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
        Get-Help sha1sum -Detailed
        return
    }
    If ($version)
    {
        Write-Host 1.0.0
        return
    }

    return _calc_sum -Path $path -Algorithm SHA1
}
Export-ModuleMember -Function sha1sum

function sha256sum
{
<#
.SYNOPSIS
Computes SHA256 message digest

.DESCRIPTION
Computes and prints SHA256 (256-bit) message digest.

.PARAMETER path
Path for which SHA256 sum will be computed.
.PARAMETER help
Display detailed help and exit.
.PARAMETER version
Output version information and exit.

.EXAMPLE
sha256sum file.txt
29655fd63cb21152f1fb2e0732aaa5c2b9d4bf0729ab462bb2a83503d568850b  file.txt
.EXAMPLE
sha256sum *
29655fd63cb21152f1fb2e0732aaa5c2b9d4bf0729ab462bb2a83503d568850b  file.txt
526f503c226af26e2772a3d01673a147219271175ac2dc3a12bf94b9ac109536  file2.txt
cb3133e67ec3c6d852cdad14c090fc067e5d690041cdc3ff047f44305d1c1343  file3.txt
.EXAMPLE
sha256sum file?.txt
526f503c226af26e2772a3d01673a147219271175ac2dc3a12bf94b9ac109536  file2.txt
cb3133e67ec3c6d852cdad14c090fc067e5d690041cdc3ff047f44305d1c1343  file3.txt

.NOTES
Author: Adam Gabrys
Version: 1.0.0

Changelog:
1.0.0:
  * Allowed calculation of SHA256 sum
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
        Get-Help sha256sum -Detailed
        return
    }
    If ($version)
    {
        Write-Host 1.0.0
        return
    }

    return _calc_sum -Path $path -Algorithm SHA256
}
Export-ModuleMember -Function sha256sum

function sha384sum
{
<#
.SYNOPSIS
Computes SHA384 message digest

.DESCRIPTION
Computes and prints SHA384 (384-bit) message digest.

.PARAMETER path
Path for which SHA384 sum will be computed.
.PARAMETER help
Display detailed help and exit.
.PARAMETER version
Output version information and exit.

.EXAMPLE
sha384sum file.txt
51d7176eb3e03fc0e7c647e658346cff1deb8e4e3d4fe93cc757dd686b89d48824256bb55408c590ccbf08ca92960622  file.txt
.EXAMPLE
sha384sum *
51d7176eb3e03fc0e7c647e658346cff1deb8e4e3d4fe93cc757dd686b89d48824256bb55408c590ccbf08ca92960622  file.txt
f4de95006c7b002f87efa08a2b5a1d7e0b731f7c63fffefb19b4c543cf9f9265f2071bb6bd3ba34e6b5e81f4fe3e6d07  file2.txt
b0dabec1d8bb6f95a9cd0f4425a49b18ddec1e2d1e60b4a577426c3dcbe41c451c472f32516f5a97a1371a51f42b4de9  file3.txt
.EXAMPLE
sha384sum file?.txt
f4de95006c7b002f87efa08a2b5a1d7e0b731f7c63fffefb19b4c543cf9f9265f2071bb6bd3ba34e6b5e81f4fe3e6d07  file2.txt
b0dabec1d8bb6f95a9cd0f4425a49b18ddec1e2d1e60b4a577426c3dcbe41c451c472f32516f5a97a1371a51f42b4de9  file3.txt

.NOTES
Author: Adam Gabrys
Version: 1.0.0

Changelog:
1.0.0:
  * Allowed calculation of SHA384 sum
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
        Get-Help sha384sum -Detailed
        return
    }
    If ($version)
    {
        Write-Host 1.0.0
        return
    }

    return _calc_sum -Path $path -Algorithm SHA384
}
Export-ModuleMember -Function sha384sum

function sha512sum
{
<#
.SYNOPSIS
Computes SHA512 message digest

.DESCRIPTION
Computes and prints SHA512 (512-bit) message digest.

.PARAMETER path
Path for which SHA512 sum will be computed.
.PARAMETER help
Display detailed help and exit.
.PARAMETER version
Output version information and exit.

.EXAMPLE
sha512sum file.txt
618f52523702b4071caacbb2d9dab99f52ede67751366f6630e7c6f2a5d1a570ba510dbb2efff4022b118c54f78fe592132036ca4577411106e3dd7a868006a1  file.txt
.EXAMPLE
sha512sum *
618f52523702b4071caacbb2d9dab99f52ede67751366f6630e7c6f2a5d1a570ba510dbb2efff4022b118c54f78fe592132036ca4577411106e3dd7a868006a1  file.txt
4df064afa8c8e1eda0fc284d00d26babad4be5d13f0a72498a969902dd54231ded3f826fce414d107c890c8ea859365182686b1b7782034350f06f400879ff47  file2.txt
1d4321dca330830b45e90a4ae4e668b12d5d290329405b9f8f964b3f882fb65f10bd1d6297d805dc4cff9ae979d5b0acad7045625157a78df88c26bbac942b44  file3.txt
.EXAMPLE
sha512sum file?.txt
4df064afa8c8e1eda0fc284d00d26babad4be5d13f0a72498a969902dd54231ded3f826fce414d107c890c8ea859365182686b1b7782034350f06f400879ff47  file2.txt
1d4321dca330830b45e90a4ae4e668b12d5d290329405b9f8f964b3f882fb65f10bd1d6297d805dc4cff9ae979d5b0acad7045625157a78df88c26bbac942b44  file3.txt

.NOTES
Author: Adam Gabrys
Version: 1.0.0

Changelog:
1.0.0:
  * Allowed calculation of SHA512 sum
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
        Get-Help sha512sum -Detailed
        return
    }
    If ($version)
    {
        Write-Host 1.0.0
        return
    }

    return _calc_sum -Path $path -Algorithm SHA512
}
Export-ModuleMember -Function sha512sum

function _calc_sum() {
Param(
    [String]$path,
    [String]$algorithm
)
    If (!(Test-Path $path))
    {
        Throw "No such file or directory: " + $path
    }

    $items = Get-Item $path

    $sums = New-Object System.Collections.Generic.LinkedList[System.String]
    ForEach ($item in $items)
    {
        If ((Get-Item $item) -is [System.IO.FileInfo])
        {
            $result = Get-FileHash $item -Algorithm $algorithm
            $hash = $result.Hash.ToLower()
            $filename = Split-Path $result.Path -Leaf
            $sums.Add("$hash  $filename");
        }
    }
    return $sums
}
