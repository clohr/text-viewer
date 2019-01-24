.PHONY: all build minify serve clean

all: clean build minify

build:
		elm make src/Main.elm --optimize --output=dist/main.js

minify:
		uglifyjs dist/main.js --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | uglifyjs --mangle --output=dist/main.min.js

serve:
		cd dist; python -m http.server 3000

clean:
		@echo "Cleaning up..."
		rm dist/main.js
		rm dist/main.min.js