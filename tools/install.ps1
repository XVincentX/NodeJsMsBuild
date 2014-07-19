param($installPath, $toolsPath, $package, $project)


if !(Get-Command "grunt" -errorAction SilentlyContinue)
{
  $project.projectitems.item('Scripts').ProjectItems.Item('Gruntfile.js').Delete()
}

if !(Get-Command "gulp" -errorAction SilentlyContinue)
{
  $project.projectitems.item('Scripts').ProjectItems.Item('gulpfile.js').Delete()
}
