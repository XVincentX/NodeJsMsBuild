param($installPath, $toolsPath, $package, $project)

Function Test-CommandExists
{
 Param ($command)
 $oldPreference = $ErrorActionPreference
 $ErrorActionPreference = 'stop'
 try {if(Get-Command $command){RETURN $true}}
 Catch {RETURN $false}
 Finally {$ErrorActionPreference=$oldPreference}
}

if (Test-CommandExists "grunt" -eq $false -and Test-CommandExists "./.bin/grunt" -eq $false -and Test-CommandExists "./node_modules/.bin/grunt" -eq $false)
{
  Write-Host "Unable to find grunt; Gruntfile.js removed from project. You can find it anyway showing all items"
  $project.ProjectItems.Item('Gruntfile.js').Remove()
}

if (Test-CommandExists "gulp" -eq $false -and Test-CommandExists "./.bin/gulp" -eq $false -and Test-CommandExists "./node_modules/.bin/gulp" -eq $false)
{
  Write-Host "Unable to find gulp; gulpfile.js removed from project. You can find it anyway showing all items"
  $project.ProjectItems.Item('gulpfile.js').Remove()
}

  $project.ProjectItems.Item('DelFolder.bat').Remove()
