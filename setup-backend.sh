#!/bin/bash

sudo docker network create pool_app_network

sudo docker run -d --name mongo --network pool_app_network mongo:latest

#docker build -t docker.io/jpeckover/pool_backend:latest .
sudo docker pull jpeckover/pool_backend:latest

sudo docker run -d --name backend --network pool_app_network -p 8080:8080 jpeckover/pool_backend:latest

#docker ps
#docker logs -f backend
