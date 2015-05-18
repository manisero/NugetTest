param(
    [switch]$KeepNuspec
)

Import-Module .\constants.psm1
Import-Module .\internal\utils.psm1

$Global:ErrorActionPreference = "Stop"

$currentVersion = Get-PackageVersion -NuspecPath $NuspecPath

$currentVersion.Patch++
$newVersion = Format-Version $currentVersion

.\publish_version.ps1 -Version $newVersion -KeepNuspec:$KeepNuspec.IsPresent
