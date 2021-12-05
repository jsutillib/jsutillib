# Javascript Utilities Library (jsutillib)
This library pretends to be a set of utility functions, clases, etc. that can be used in JavaScript applications. The underlying idea is to create curated components that are flexible enough to be re-used in different applications. The library is composed by a set of sub projects that have their specific functionality, but together they are more powerful together.

> Some parts of the library are intended to be used in conjunction with jQuery and/or Bootstrap. Please check the documentation of each project for more information.

## Parts of the Library

The library is built from the next projects:

- [_common utilities_](https://github.com/jsutilslib/common), which is set of javascript helper classes and functions for javascript applications. (e.g. object cloning, html tag creation using pug/jade syntax, objects processing, etc.)
- [_selection utilities_](https://github.com/jsutilslib/selection), that is a set of javascript components that enable to have components in which _draw selections_, _make html elements grabbable_ to be moved around the page, and also make _div resizable_.
- [_active objects_](https://github.com/jsutilslib/activeobject), that converts an object into an _active object_ that can emit events when one of its properties changes its value.

## Installation

### From a CDN

The preferred method to use _jstilslib_ is to get it from a CDN, and put it after jQuery and Bootstrap:

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/jsutilslib/jsutilslib@1.0.0-beta/jsutilslib.min.js"></script>
```

### From source

A `Makefile` is provided to create the single all-in-one `js` and `css` files for the library.

```console
# npm install -g uglify-js clean-css-cli
...
# git clone https://github.com/jsutilslib/jsutilslib --recursive
# cd jsutilslib
# make
Building common
uglifyjs js/*.js  -b | cat notice - > common.js
uglifyjs js/*.js  | cat notice.min - > common.min.js
Building selection
uglifyjs js/*.js  -b | cat notice - > selection.js
uglifyjs js/*.js  | cat notice.min - > selection.min.js
cleancss css/*.css --format beautify | cat notice - > selection.css
cleancss css/*.css | cat notice.min - > selection.min.css
Building activeobject
uglifyjs js/*.js  -b | cat notice - > activeobject.js
uglifyjs js/*.js  | cat notice.min - > activeobject.min.js
uglifyjs init.js  common/common.js  selection/selection.js  activeobject/activeobject.js -b  | cat notice - > jsutilslib.js
uglifyjs init.js  common/common.min.js  selection/selection.min.js  activeobject/activeobject.min.js  | cat notice.min - > jsutilslib.min.js
cleancss selection/selection.css --format beautify | cat notice - > jsutilslib.css
cleancss selection/selection.css | cat notice.min - > jsutilslib.min.css
```

Now you can use files `jsutilslib.min.js` and `jsutilslib.min.css` in your project:

```html
<link rel="stylesheet" href="jsutilslib.min.css">
<script src="jsutilslib.min.js"></script>
```
