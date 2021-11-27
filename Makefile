all: buildjs buildcss

buildjs: $(wildcard */*.js)
	mkdir -p jsutillib && touch jsutillib/.empty.js
	uglifyjs */*.js -o jsutils.min.js

buildcss: $(wildcard */*.css)
	mkdir -p jsutillib && touch jsutillib/.empty.css
	uglifycss */*.css > jsutils.min.css

clean:
	rm -rf jsutils.min.js jsutils.min.css jsutillib/.empty.js jsutillib/.empty.css