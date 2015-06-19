param(
    [switch]$KeepNupkg
)

Import-Module .\constants.psm1
Import-Module .\internal\utils.psm1

$Global:ErrorActionPreference = "Stop"

$currentVersion = Get-PackageVersion -NuspecPath $NuspecPath
$newVersion = Format-Version -Major ($currentVersion.Major + 1) -Minor 0 -Patch 0

.\publish_version.ps1 -Version $newVersion -KeepNupkg:$KeepNupkg.IsPresent
