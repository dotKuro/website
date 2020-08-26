FROM nginx:stable

WORKDIR /app
RUN apt-get update
RUN curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
RUN gunzip elm.gz
RUN chmod +x elm
RUN mv elm /usr/bin/elm

COPY build.sh /app/build.sh
COPY src /app/src
COPY src/index.html /app/dist/index.html
COPY fonts /app/dist/fonts
COPY elm.json /app/elm.json
COPY ngnix.conf /etc/nginx/nginx.conf

RUN ./build.sh --prod
