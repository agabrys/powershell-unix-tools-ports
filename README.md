# About
[![License BSD 2-Clause](https://img.shields.io/badge/license-BSD%202--Clause-blue.svg)](https://raw.githubusercontent.com/agabrys/powershell-unix-tools-ports/master/LICENSE.md)

PowerShell Unix Tools Ports is a library with provides some very popular tools used on Unix system (e.g. `md5sum`).

## Installation
To install the library for your user you have to:
1. open PowerShell
1. checkout repository: `git clone https://github.com/agabrys/powershell-unix-tools-ports.git`
2. execute `.\powershell-unix-tools-ports\install.ps1` script

After these steps you can use tools. Instalation is persistent (still works after computer reboot).

## Ported tools
Table with list of ported tools:

| Tool | Description |
| --- | --- |
| `md5sum` | Computes MD5 message digest |
| `sha1sum` | Computes SHA1 message digest |
| `sha256sum` | Computes SHA256 message digest |
| `sha384sum` | Computes SHA384 message digest |
| `sha512sum` | Computes SHA512 message digest |