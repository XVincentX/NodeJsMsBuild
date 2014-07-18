var gulp = require("gulp");
var chug = require("gulp-chug");
var nuget = require("gulp-nuget");
var request = require('request');
var fs = require('fs');

gulp.task('nuget-download', function(done) {
    if(fs.existsSync('nuget.exe')) {
        done();
        return;
    }

    request.get('http://nuget.org/nuget.exe')
        .pipe(fs.createWriteStream('nuget.exe'))
        .on('close', done);
});

gulp.task("default",["nuget-download"],function task()
{
  gulp.src("")
  .pipe(nuget.pack(
    {
      nuspec:"NodeJsMsBuild.nuspec",
      nuget: "nuget.exe",
      version: "1.0.0"
    }))
  .pipe(gulp.dest("NodeJsMsBuild.nupkg"));
});
