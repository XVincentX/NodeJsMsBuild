var gulp = require("gulp");
var chug = require("gulp-chug");
var nuget = require("gulp-nuget");
var request = require("request");
var fs = require("fs");
var rimraf = require("gulp-rimraf")

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

  gulp.src("README.md")
  .pipe(gulp.dest("readme.txt"));

  gulp.src(["build/**","tools/**"])
  .pipe(nuget.pack(
    {
      nuspec:"NodeJsMsBuild.nuspec",
      nuget: "nuget.exe",
      version: "1.0.0"
    }))
  .pipe(gulp.dest("NodeJsMsBuild.nupkg"));
});


gulp.task("clean",function clean(cb)
{
  gulp.src(["*.exe","*.txt","node_modules/**","NodeJsMsBuild.nupkg/**"],{read:false}).pipe(rimraf());
})
