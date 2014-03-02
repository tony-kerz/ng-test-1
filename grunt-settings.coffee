WORKING_DIRECTORY = 'app'
DESTINATION = 'mock-api/public'
VENDOR = 'vendor'
TEST = 'specs'

MODULE_SOURCES =
  jade: ['**/*.jade']
  coffee: ['**/*.coffee', '!**/*.test.coffee']
  coffeelint: ['**/*.coffee']
  compass: ['**/*.scss']
  css: ['**/*.css', "!#{VENDOR}/**/*.css"]
  javascript: ['**/*.js', "!#{VENDOR}/**/*.js"]
  reload: ['**/*.html', '**/*.js', '**/*.css']
  tests: ['**/*.test.coffee']
  vendor: [
    'd3/d3.js',
    'numeral/numeral.js',
    'angular/angular.js',
    'angular-ui-router/angular-ui-router.js',
    'angular-numeraljs/angular-numeraljs.js'
    'moment/moment.js',
    'lodash/lodash.js',
    'angular-flash/angular-flash.js',
    'bower-debug/debug.js'
  ]
  vendorCss: ["#{VENDOR}/**/*.css"]


module.exports =
  cwd: WORKING_DIRECTORY
  dest: DESTINATION
  src: MODULE_SOURCES
  test: TEST
  vendor: VENDOR
  bower: "#{DESTINATION}/#{VENDOR}"
  addWorkingDir: (src, cwd) ->
    src.map (glob) -> "#{cwd}/#{glob}"
