#!/bin/bash

#docker network create pool_app_network

#docker run -d --name mongo --network pool_app_network mongo:latest

#docker build -t docker.io/jpeckover/pool_backend:latest
docker pull jpeckover/pool_backend:latest

docker run -d --name backend -e MONGO_HOST=10.0.0.34 -p 8080:8080 jpeckover/pool_backend:latest

#docker ps
#docker logs -f backend
