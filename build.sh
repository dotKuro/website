#!/usr/bin/env sh

if [ "${1:-"--dev"}" = "--prod" ]
then

elm make src/Main.elm --optimize --output dist/unminified_main.js &&
uglifyjs dist/unminified_main.js --compress "pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe" | uglifyjs --mangle --output dist/main.js

else

elm make src/Main.elm --output dist/main.js &&
cp src/index.html dist/index.html
cp -r fonts/ dist/

fi
