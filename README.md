# gulp-boxen

[![Travis](https://img.shields.io/travis/malyutinegor/gulp-boxen.svg?style=flat-square)](https://github.com/malyutinegor/gulp-boxen) [![npm](https://img.shields.io/npm/v/gulp-boxen.svg?style=flat-square)](https://www.npmjs.com/package/gulp-boxen)  [![repo](https://img.shields.io/badge/repo-on_github-green.svg?style=flat-square)](https://github.com/malyutinegor/gulp-boxen) [![gulp](https://img.shields.io/badge/gulp_plugin-yes-green.svg?style=flat-square)](https://npmjs.com/package/gulp) [![useless](https://img.shields.io/badge/useless-yes-green.svg?style=flat-square)](https://npmjs.com/package/gulp-boxen)

This is useless plugin for wrapping your files's content to boxes. Uses [boxen](https://www.npmjs.com/package/boxen).

## Installation

```bash
npm i gulp-boxen
```

## Example

**text.txt**:
```
foo bar
```

**Gulpfile.coffee**:
```coffee
gulp  = require 'gulp'
boxen = require 'gulp-boxen'

gulp.task 'build', () ->
	gulp.src 'text.txt'
		.pipe boxen
			padding:     3
			margin:      2
			borderStyle: "double"

		.pipe gulp.dest 'results'

gulp.task 'default', [ 'build' ]
```

or **Gulpfile.js**:
```js
var gulp  = require('gulp');
var boxen = require('../../index.js');

gulp.task( 'build', function() {
	gulp.src( 'text.txt' )
		.pipe( boxen({
    		padding: 3,
    		margin: 2,
    		borderStyle: "double"
  		}))

  		.pipe(gulp.dest( 'results' ))
});

gulp.task('default', [ 'build' ]);
```

Run:
```
gulp
```

Now **results/text.txt** is
```


      ╔════════════════════════════╗
      ║                            ║
      ║                            ║
      ║                            ║
      ║         GULP-BOXEN         ║
      ║                            ║
      ║                            ║
      ║                            ║
      ╚════════════════════════════╝


```

## API

See boxen's [API](https://www.npmjs.com/package/boxen).

## License

[MIT](https://github.com/malyutinegor/gulp-boxen/blob/master/LICENSE).