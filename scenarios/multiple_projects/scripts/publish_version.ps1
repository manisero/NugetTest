param(
	[Parameter(Mandatory=$true)][string]$Version,
    [switch]$KeepNuspec
)

Import-Module .\internal\utils.psm1

$Global:ErrorActionPreference = "Stop"

$nuspecPath = "..\src\MultipleProjects\MultipleProjects.nuspec"

#region Main

$packageId = Get-PackageID -NuspecPath $nuspecPath

Set-PackageVersion -NuspecPath $nuspecPath -Version $Version
nuget pack $nuspecPath -Prop Configuration=Release

if(!$KeepNuspec)
{
    $nupkgName = "{0}.{1}.nupkg" -f $packageId, $Version

    "Removing '$nupkgName' file."
    Remove-Item $nupkgName
}

#endregion Main
