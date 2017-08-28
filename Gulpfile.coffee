gulp   = require 'gulp'
uglify = require 'gulp-uglify'
mocha  = require 'gulp-mocha'
del    = require 'del'
seq    = require 'run-sequence'
exec   = require('child_process').exec

gulp.task 'build', ->
	del 'build/index.js'

	gulp.src 'index.js'
		.pipe uglify()
		.pipe gulp.dest 'build/'

	gulp.src 'package.json'
		.pipe gulp.dest 'build/'

gulp.task 'test', ->
	gulp.src 'test/test.js'
		.pipe mocha()

gulp.task 'default', () ->
	seq 'test', 'build'