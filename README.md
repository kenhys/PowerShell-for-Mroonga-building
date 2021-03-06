Tiny PowerShell Script to build Mroonga under Windows environment
===

[![Build status](https://ci.appveyor.com/api/projects/status/2xsau53jpm9cpu3y/branch/master?svg=true)](https://ci.appveyor.com/project/cosmo0920/powershell-for-mroonga-building/branch/master)

## PowerShell Excecution Policy

Currently, these ps1 are not signed.

So, it needs change Excecution Policy to `RemoteSigned`.

Or, execute `batfile\change-policy-vc2015.bat` or `batfile\change-policy-vc2017.bat` with system administrator privileges.

## Project structure

```log
---(source.zip/source-nightly.zip) downloaded by get-mroonga.ps1/get-mroonga-nightly.ps1
 |
 -- (batfiles) # downloaded by `get-mroonga-batfiles.ps1`.
 |
 -- *.ps1
```

## versions.ps1

```powershell
$workDir = [specify workdir]
$mariadbVer = [specify mariaDB version]
$mroongaVer = [specify Mroonga version]
$useNightly = ($null|$true)
$skipDownloadRequest = ($null|$true)
$mroongaSourceBaseURI = $null # for customizing source download URI
$mroongaSourceNightlyBaseURI = $null # for customizing nightly source download URI
```

## install-cmake-3.10.ps1

To install moderate version of cmake for Mroonga building under Windows environment.

Currently, this ps1 installs `cmake-3.10.3`.

```powershell
powershell> .\install-cmake-3.10.ps1
```

## building for Visual Studio 2015 Community

```powershell
powershell> .\build-vc2015.ps1
```

## building for Visual Studio 2017 Community

```powershell
powershell> .\build-vc2017.ps1
```

## execution order ps1 if it executes individually

```bat
powershell> .\get-mroonga.ps1 # or get-mroonga-nightly.ps1
powershell> .\unzip.ps1
powerShell> .\get-mroonga-batfiles.ps1
powershell> .\prepare-building-mroonga.ps1
powershell> cd <mroonga build working dir>
powershell> <building Mroonga...>
powershell> .\package-unzip.ps1
powershell> .\install-mroonga.ps1
powershell> .\create-mrnzip.ps1
```

## Building prior Mroonga releases

If you are interested in building prior Mroonga releases, please checkout prior releases' git tags as follows:


```powershell
PS> git tag
PS> git checkout <prior release tag>
```

### for developer

```powershell
$applyPatch = $TRUE
```

and then, put into `patches` directory, patches are applied automatically with GNU patch.

### Requirements

* System.IO.Compression.FileSystem.dll

It is contained from .NET Framework 4.5.

See in more detail: [MSDN](http://msdn.microsoft.com/ja-jp/library/system.io.compression.zipfile.aspx)

* GNU patch (optional)

### LICENSE

[MIT](LICENSE).

### TODO

* 'ERROR 2003 (HY000): Can't connect to MySQL server on 'localhost' (10061 "Unknown error")' error message sometimes occurs.
