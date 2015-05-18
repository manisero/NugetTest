function Get-PackageID($NuspecPath)
{
    $nuspec = [xml](Get-Content $NuspecPath)

    return $nuspec.package.metadata.id
}

function Get-PackageVersion($NuspecPath)
{
    $nuspec = [xml](Get-Content $NuspecPath)

    return $nuspec.package.metadata.version
}

function Set-PackageVersion($NuspecPath, $Version)
{
    $nuspec = [xml](Get-Content $NuspecPath)

    $nuspec.package.metadata.version = $Version
    $nuspec.Save($NuspecPath)
}
