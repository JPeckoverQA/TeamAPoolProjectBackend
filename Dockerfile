# base image
FROM ubuntu:latest
USER root
RUN apt update
# install wget & curl
RUN apt install -y curl wget sudo
# nodejs apt repo and installation
RUN curl -sL https://deb.nodesource.com/setup_12.x | -E bash -
RUN apt install -y nodejs
# configure server user
RUN useradd -m -s /bin/bash backend
USER backend
# copy code in
WORKDIR /opt/backend
COPY . .
# get dependencies
RUN npm install
# main process for the container when it runs
ENTRYPOINT ["/usr/local/bin/node", "Index.js"]
