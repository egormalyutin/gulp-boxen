gulp   = require 'gulp'
uglify = require 'gulp-uglify'
del    = require 'del'
exec   = require('child_process').exec

gulp.task 'build', ->
	del 'build/index.js'

	gulp.src 'index.js'
		.pipe uglify()
		.pipe gulp.dest 'build/'

	gulp.src 'package.json'
		.pipe gulp.dest 'build/'

gulp.task 'upload', ->