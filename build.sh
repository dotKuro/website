#!/usr/bin/env sh

elm make src/Main.elm --output dist/main.js &&
cp src/index.html dist/index.html