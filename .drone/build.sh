#!/bin/bash

set -e  
#cd /var/cache/drone/src/path/to/app

# [pass tests here]

wrapdocker &  
sleep 5

docker build -t registry.local.lab:5000/academy:1 .
#docker commit edipro-deb79 registry.edi.su/edipro-deb79
docker push registry.local.lab:5000/academy:1

