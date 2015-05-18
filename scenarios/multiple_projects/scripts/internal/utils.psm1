function Get-PackageID($NuspecPath)
{
    $nuspec = [xml](Get-Content $NuspecPath)

    return $nuspec.package.metadata.id
}

function Get-PackageVersion($NuspecPath)
{
    $nuspec = [xml](Get-Content $NuspecPath)

    $versionSegments = $nuspec.package.metadata.version.Split('.')
    $major = [int]::Parse($versionSegments[0])
    $minor = [int]::Parse($versionSegments[1])
    $patch = [int]::Parse($versionSegments[2])

    return New-Object PSObject -Property @{ Major=$major; Minor=$minor; Patch=$patch }
}

function Set-PackageVersion($NuspecPath, $Version)
{
    $nuspec = [xml](Get-Content $NuspecPath)

    $nuspec.package.metadata.version = $Version
    $nuspec.Save($NuspecPath)
}

function Format-Version($VersionObject)
{
    return "{0}.{1}.{2}" -f $VersionObject.Major, $VersionObject.Minor, $VersionObject.Patch
}
