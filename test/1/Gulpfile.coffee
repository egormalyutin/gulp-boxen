gulp  = require 'gulp'
del   = require 'del'
boxen = require '../../index.js'

gulp.task 'build', () ->
	gulp.src 'text.txt'
		.pipe boxen
			padding:     3
			margin:      2
			borderStyle: "double"

		.pipe gulp.dest 'results'

gulp.task 'clean', () ->
	del 'results'

gulp.task 'default', [ 'build' ]