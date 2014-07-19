param($installPath, $toolsPath, $package, $project)

if !(Get-Command "npm" -errorAction SilentlyContinue)
{}

if !(Get-Command "grunt" -errorAction SilentlyContinue)
{}

if !(Get-Command "gulp" -errorAction SilentlyContinue)
{}
