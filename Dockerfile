FROM arm64v8/node:8.11-alpine

RUN apk add --update git mercurial && \
    git clone https://github.com/os-js/OS.js.git app && \
    apk del git mercurial

WORKDIR /app

RUN npm install
RUN node osjs build

EXPOSE 8000

CMD node osjs run