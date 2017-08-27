#################
# REQUIRE
#################
util     = require 'gulp-util'
th	     = require 'through2'
stream   = require 'stream'
boxen    = require 'boxen'
Duplex   = stream.Duplex

#################
# TO STREAM
#################
toStream = (buffer) ->
	stream = new Duplex
	stream.push buffer
	stream.push null
	stream

module.exports = (settings) ->
	pipe = (file, enc, callback) ->
		if file.isNull()
			return callback null, file

		# Turn file into a stream:
		if file.isBuffer()
			file.contents = toStream file.contents

		# Reading:

		allText = ""

		file.contents = file.contents.pipe(th.obj (chunk, enc, callback) ->
			allText += chunk.toString()
			return callback null, chunk
		)

		# When reading is finished:
		self = @
		file.contents.on 'finish', () ->
			# Create a box now!
			box = boxen allText, settings
			# Write box to file:
			file.contents = new Buffer box
			self.push file

		return callback null, file

	end  = (callback) ->
		callback()

	# Return pipe.
	th.obj pipe, end