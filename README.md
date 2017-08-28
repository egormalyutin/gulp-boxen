# gulp-boxen

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

[MIT](https://github.com/malyutinegor/gulp-boxen/).