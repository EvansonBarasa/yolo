FROM alpine:latest

LABEL maintain = "sniffer <evanzo85@gmail.com>"

RUN apk update && apk add nodejs nodejs-npm
COPY client /client
WORKDIR /client
RUN npm install
RUN npm run build
RUN npm install -g serve
EXPOSE 3000
CMD [ "serve", "-s", "build", "-l", "3000" ]
