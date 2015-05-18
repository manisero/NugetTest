param(
    [switch]$KeepNuspec
)

Import-Module .\constants.psm1
Import-Module .\internal\utils.psm1

$Global:ErrorActionPreference = "Stop"

$currentVersion = Get-PackageVersion -NuspecPath $NuspecPath
$newVersion = Format-Version -Major $currentVersion.Major -Minor ($currentVersion.Minor + 1) -Patch 0

.\publish_version.ps1 -Version $newVersion -KeepNuspec:$KeepNuspec.IsPresent
