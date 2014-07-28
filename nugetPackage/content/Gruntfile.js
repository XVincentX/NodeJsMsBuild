module.exports = function(grunt) {

  grunt.initConfig({});

  grunt.registerTask("shared", function shared(){

  });

 grunt.registerTask("Release", ["shared"], function Release(){

 });

  grunt.registerTask("Debug", ["shared"], function Debug(){

  });

  grunt.registerTask('default', ["shared"], function defaultTask(){

  });

};
