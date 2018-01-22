#!/bin/sh

# prepare a Volume for the Drone server's db
docker volume create drone-server-data

# init swarm mode
docker swarm init

# perform the deploy
docker stack deploy -c docker-stack.yml drone-ci
