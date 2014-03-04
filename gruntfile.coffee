module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-env'
  grunt.loadNpmTasks 'grunt-protractor-runner'

  settings = require('./grunt-settings')

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    bower:
      dev:
        options:
          targetDir: settings.bower
          verbose: true
          cleanTargetDir: true
    clean:
      dev: [settings.dest]
      test: [settings.test]
    coffee:
      dev:
        src: settings.src.coffee
        cwd: settings.cwd
        dest: settings.dest
        expand: true
        options:
          sourceMap: true
        #ext: '.js'
        rename: (dest, src) ->
          "#{dest}/#{src.replace(/\.coffee$/, '.js')}"
      test:
        src: settings.src.tests
        cwd: settings.cwd
        dest: settings.test
        expand: true
        ext: '.test.js'
    coffeelint:
      dev:
        files:
          src: settings.addWorkingDir(settings.src.coffeelint, settings.cwd)
        options:
          arrow_spacing:
            level: 'error'
          colon_assignment_spacing:
            level: 'error'
            spacing:
              left: 0
              right: 1
          no_empty_param_list:
            level: 'error'
          no_stand_alone_at:
            level: 'error'
          space_operators:
            level: 'error'
          max_line_length:
            value: 132,
            level: 'warn'
    compass:
      dev:
        options:
          sassDir: settings.cwd
          cssDir: settings.dest
    copy:
      dev:
        files: [
          expand: true
          cwd: 'app/'
          src: ["#{settings.vendor}/*"]
          dest: settings.dest
        ]
    delta:
      coffee:
        files: settings.src.coffee
        tasks: ['coffeelint', 'coffee']
        options:
          spawn: true
      compass:
        files: settings.src.compass
        tasks: ['compass:dev']
        options:
          spawn: true
      jade:
        files: settings.src.jade
        tasks: ['jade:dev']
        options:
          spawn: true
      reload:
        files: settings.addWorkingDir(settings.src.reload, settings.dest)
        options:
          spawn: true
          livereload: true
    env:
      dev:
        NODE_ENV: 'development'
#      test:
#        NODE_ENV: 'test'
      deploy:
        NODE_ENV: 'deploy'
    jade:
      dev:
        options:
          data:
            debug: true
            ENV: process.env
            JS_SRC: -> grunt.file.expand({ cwd: settings.dest }, settings.src.javascript)
            CSS_SRC: -> grunt.file.expand({ cwd: settings.dest }, settings.src.css)
            VENDOR_CSS_SRC: -> grunt.file.expand({ cwd: settings.dest }, settings.src.vendorCss)
            VENDOR_SRC: settings.addWorkingDir(settings.src.vendor, settings.vendor)
        files: [
          src: settings.src.jade
          cwd: settings.cwd
          dest: settings.dest
          #ext: '.html'
          expand: true
          rename: (dest, src) ->
            "#{dest}/#{src.replace(/\.jade$/, '.html')}"
        ]
    protractor:
      dev:
        options:
          args:
            seleniumServerJar: 'node_modules/protractor/selenium/selenium-server-standalone-2.39.0.jar'
            specs: ['specs/**/*.test.js']

  grunt.renameTask 'watch', 'delta'
  grunt.registerTask 'watch', ['default', 'server', 'delta']

  grunt.registerTask 'common', ['clean:dev', 'bower:dev', 'coffeelint:dev', 'coffee:dev', 'compass:dev', 'jade:dev', 'copy:dev']

  grunt.registerTask 'test', ['common', 'clean:test', 'coffee:test', 'protractor']

  grunt.registerTask 'deploy', ['env:deploy', 'common']

  grunt.registerTask 'default', ['env:dev', 'common']

  grunt.registerTask 'server', 'Start Mock Api Server', ->
    require('./mock-api/server')
