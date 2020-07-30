FROM nginx:stable

WORKDIR /app
RUN apt-get update
RUN apt-get install entr -y
RUN curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
RUN gunzip elm.gz
RUN chmod +x elm
RUN mv elm /usr/bin/elm

CMD nginx -g "daemon on;" && find src/ | entr sh build.sh