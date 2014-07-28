NodeJsMsBuild
=============

![Alt text](https://rawgit.com/XVincentX/NodeJsMsBuild/master/NodeJsMsBuild.png)

# MsBuild tasks for NodeJS tools

Build status: [![Build status](https://ci.appveyor.com/api/projects/status/ywwyx7c541p3e9cx/branch/master)](https://ci.appveyor.com/project/XVincentX/nodejsmsbuild/branch/master)
Nuget downloads: [![Nuget Downloads](http://img.shields.io/nuget/dt/NodeJsMsBuild.svg)](http://img.shields.io/nuget/dt/NodeJsMsBuild.svg)

[CI Nuget feed](https://ci.appveyor.com/nuget/nodejsmsbuild-5f8xp8p45090)


This project is a collection of utilities that will inject some targets/files into your
Visual Studio project and integrating NodeJs tools.


**NOTE:** This project is all about plain MsBuild task. No tools will be inserted
into your project. They are up to you.

## Yes but why?
At first, there are a [lot](https://www.nuget.org/packages/nodejs-v.0.8.16/),a
[lot](https://www.nuget.org/packages/nji/) and a [lot](https://www.nuget.org/packages/Node.js/)
of nuget packages claiming NodeJS support. I know that more will come in near future.
The same is for Bower, Grunt, Gulp and other tools.
I do not know which one to choose, and which one will be updated time
after time. Futhermore, a lot of users (like me) have got a global npm
installation and want to take advantage of that one. For this reason I prefer to
install in your project only the targets with several search options. The rest
is up to you.

This project is born after [this article](http://www.dotnet-programming.com/post/2014/07/11/Integrate-NodeJS-tools-in-Visual-StudioTFS.aspx).

If you're looking for binaries, point your browser to the
[nuget package](https://www.nuget.org/packages/NodeJSMsBuild/)

## I want to build on my own
```javascript
grunt
```
This will output a nuget package that you may upload on your nuget feed.

Clean generated code
```javascript
grunt clean //I think it does not work now.
```

## Gimme the bits
Open your Visual Studio copy and search for _NodeJsMsBuild_ package.
Once installed, it will
* Insert into your project a **Gruntfile.js** and a **gulpfile.js**. Both of them
 have got:
  * A _shared_ task
  * A _default_ task
  * A _Debug_ task
  * A _Release_ task

  All of these are empty and all depends from _shared_.

* The _Install.ps1_ script will detect presence of package managers and will
remove from project (but not delete from file system) the unnecessary task files.
If you have got both of task runners (will you?), both files will be leaved in
your project.

* 3 named targets will be imported into your projects. These are:
  * **CleanNodeJsFiles**: this task will delete all _Javascript_ filed created by
  Typescript compilation process (the .js and .js.map). Then it will delete the
  entire _node_modules/_ directory and _typings_ folder as well.
  * **RestoreNodeJsPackages**: This target will run the following commands:
    * npm install
    * tsd reinstall
    * bower install
  * **RunJsBuildTasks**: This target will run grunt/gulp  tasks based on your
  configuration (Debug/Release).

The process will not fail if the executables will not be found, but a warning
message will be emitted.

## How do you detect presence of NodeJS modules?
To go into details, it will:
* Check for commands into your __PATH__. This will be fine if you install NodeJS,
NPM and other modules as global ones.
* Check for commands into _./bin_ path of your project. This is the case when
you do not want to install packages into your system, but as standalone executables.
* Check into *node_modules* bin folder of your project.

You can make this using nuget package manager too.
[NodeJs](http://www.nuget.org/packages/Node.js/),
[Npm](http://www.nuget.org/packages/Npm/),
[Bower](http://www.nuget.org/packages/Bower/),
[Gulp](http://www.nuget.org/packages/Gulp.js/) and
[Grunt](http://www.nuget.org/packages/Grunt.js/)
are avaiable as nuget packages.

  There is no support for _tsd_ at the moment, but I think [he]() will add it soon
  if you ask him.
* Check for binaries into _node_modules_ directory. This is the case if you have
got Node and NPM installed in your **PATH**, but all the other tools are installed
as _local_ packages.

If you think I mess some scenario, please open an [issue](https://github.com/XVincentX/NodeJsMsBuild/issues)

The project logo was kindly assembled by [R.Iazzetta](https://www.linkedin.com/profile/view?id=299757718)
