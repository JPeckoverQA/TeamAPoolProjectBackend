# base image
FROM ubuntu:latest
# set environment variable for mongo
ENV MONGO_HOST = mongo
USER root
RUN apt update
# install wget & curl
RUN apt install -y curl wget
# nodejs apt repo and installation
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt install -y nodejs
# configure server user
RUN useradd -m -s /bin/bash backend
# make and change to application directory
WORKDIR /opt/backend
# configure application directory permissions
RUN chown -R backend:backend .
# change to backend user
USER backend
# copy code in
COPY . .
# get dependencies
RUN npm install
# main process for the container when it runs
ENTRYPOINT ["/usr/bin/node", "Index.js"]
