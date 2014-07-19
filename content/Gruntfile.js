module.exports = function(grunt) {

  grunt.initConfig({});

  grunt.registerTask("shared", function(){

  });

 grunt.registerTask("Release", ["shared"], function(){

 });

  grunt.registerTask("Debug", ["shared"], function(){

  });

  grunt.registerTask('default', ["shared"], function(){

  });

};
