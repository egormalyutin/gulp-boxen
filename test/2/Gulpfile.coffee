gulp  = require 'gulp'
del   = require 'del'
seq   = require 'run-sequence'
boxen = require '../../index.js'

gulp.task 'build', () ->
	gulp.src 'text.txt'
		.pipe boxen
			padding:     2
			margin:      1
			borderStyle: "round"

		.pipe gulp.dest 'results'

gulp.task 'clean', () ->
	del 'results'

gulp.task 'default', () ->
	seq 'clean', 'build'