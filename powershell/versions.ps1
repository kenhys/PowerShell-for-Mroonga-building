$originDir = $(Get-Item ".").FullName
$workDir = "$originDir\work"
$mariadbVer = "10.1.32"
$mroongaVer = "8.01"
$useNightly = $null
#$useReleasePackage = $null
$downloadRequestSkip = $null
$mroongaSourceBaseURI = $null
$mroongaSourceNightlyBaseURI = $null
