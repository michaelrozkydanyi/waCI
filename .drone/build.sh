#!/bin/bash

set -e  
#cd /var/cache/drone/src/path/to/app

# [pass tests here]

wrapdocker &  
sleep 5

export DOCKER_HOST=swarm3.lab.int:2375
docker build -t docker.lab.int:5000/academy:1 .
#docker commit edipro-deb79 registry.edi.su/edipro-deb79
docker push docker.lab.int:5000/academy:1

