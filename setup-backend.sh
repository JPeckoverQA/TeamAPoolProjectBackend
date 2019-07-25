#!/bin/bash

#docker network create pool_app_network

#docker run -d --name mongo --network pool_app_network mongo:latest

#docker build -t docker.io/jpeckover/pool_backend:latest
sudo docker pull jpeckover/pool-backend-aws:latest

sudo docker run -d --name backend -e MONGO_HOST=${aws_instance.mongo.private_ip} -p 8080:8080 jpeckover/pool-backend-aws:latest

#docker ps
#docker logs -f backend
