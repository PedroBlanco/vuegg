FROM node:9-alpine

LABEL maintainer="vuegger@gmail.com"

# install git
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh python2 make g++

WORKDIR /app

# copy sources
COPY . /app

# install dependencies and build dist
RUN npm run install:all && \
    npm run build

# expose server
EXPOSE 5000

CMD ["npm", "run", "start"]
