# NOTE: Needs for run from gulp-mocha in this project.
fs     = require 'fs' 
read   = (file) -> fs.readFileSync(file).toString()

chai   = require 'chai'
assert = chai.assert 

exec   = require 'sync-exec'
chalk  = require 'chalk'

prepared = chalk.keyword 'green'

boxes = (name, n) ->
	console.log 'STARTED PREPARING TEST "' + name + '"'
	exec 'gulp', {cwd: 'test/' + n} 
	console.log prepared 'FINISHED PREPARING TEST "' + name + '"'
	it name, () ->
			text1 = read('test/' + n + '/results/text.txt')
			text2 = read('test/' + n +  '/true-result.txt')

			assert.equal text1, text2

describe 'gulp-boxen', () ->
	boxes 'Draw text "GULP-BOXEN"', 1
	boxes 'Draw text "some text"', 2
	boxes 'Draw empty box', 3