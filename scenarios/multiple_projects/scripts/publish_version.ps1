param(
	[Parameter(Mandatory=$true)][string]$Version
)

Import-Module .\internal\utils.psm1

$Global:ErrorActionPreference = "Stop"

$nuspecPath = "..\src\MultipleProjects\MultipleProjects.nuspec"

#region Main

Set-PackageVersion -NuspecPath $nuspecPath -Version $Version
nuget pack $nuspecPath -Prop Configuration=Release

#endregion Main
