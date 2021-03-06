param(
	[Parameter(Mandatory=$true)][string]$Version,
    [switch]$KeepNupkg
)

Import-Module .\constants.psm1
Import-Module .\internal\utils.psm1

$Global:ErrorActionPreference = "Stop"

#region Functions

function CheckBuild()
{
    $caption = "Build check"
    $message = "Did you build the project in '$BuildConfiguration' configuration?"

    $yes = new-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Yes"
    $no = new-Object System.Management.Automation.Host.ChoiceDescription "&No", "No"
    $choices = [System.Management.Automation.Host.ChoiceDescription[]]($yes,$no);

    $answer = $host.ui.PromptForChoice($caption, $message, $choices, 0)

    if($answer -ne 0)
    {
        throw "Then do it!"
    }
}

#endregion

#region Main

CheckBuild

Set-PackageVersion -NuspecPath $NuspecPath -Version $Version
nuget pack $NuspecPath -Prop Configuration=$BuildConfiguration

$packageId = Get-PackageID -NuspecPath $nuspecPath
$nupkgName = "{0}.{1}.nupkg" -f $packageId, $Version

nuget push $nupkgName $NugetPassword -s $NugetPackageSource

if(!$KeepNupkg)
{
    "Removing '$nupkgName' file."
    Remove-Item $nupkgName
}

#endregion
