param($installPath, $toolsPath, $package, $project)


if !(Get-Command "grunt" -errorAction SilentlyContinue || Get-Command ".bin/grunt" -errorAction SilentlyContinue) || Get-Command ".node_modules/.bin/grunt" -errorAction SilentlyContinue)
{
  Write-Host "Unable to find grunt; Gruntfile.js removed from project. You can find it anyway showing all items"
  $project.projectitems.item('Scripts').ProjectItems.Item('Gruntfile.js').Delete()
}

if !(Get-Command "gulp" -errorAction SilentlyContinue || Get-Command ".bin/gulp" -errorAction SilentlyContinue) || Get-Command ".node_modules/.bin/gulp" -errorAction SilentlyContinue)
{
  Write-Host "Unable to find gulp; gulpfile.js removed from project. You can find it anyway showing all items"
  $project.projectitems.item('Scripts').ProjectItems.Item('gulpfile.js').Delete()
}
