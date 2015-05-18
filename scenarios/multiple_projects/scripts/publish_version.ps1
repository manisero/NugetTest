param(
	[Parameter(Mandatory=$true)][string]$Version,
    [switch]$KeepNuspec
)

Import-Module .\constants.psm1
Import-Module .\internal\utils.psm1

$Global:ErrorActionPreference = "Stop"

#region Main

$packageId = Get-PackageID -NuspecPath $nuspecPath

Set-PackageVersion -NuspecPath $NuspecPath -Version $Version
nuget pack $NuspecPath -Prop Configuration=Release

$nupkgName = "{0}.{1}.nupkg" -f $packageId, $Version

#TODO: nuget push $nupkgName ...

if(!$KeepNuspec)
{
    "Removing '$nupkgName' file."
    Remove-Item $nupkgName
}

#endregion Main
