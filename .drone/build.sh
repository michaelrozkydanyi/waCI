#!/bin/bash

set -e  
#cd /var/cache/drone/src/path/to/app

# [pass tests here]

wrapdocker &  
sleep 5

cp /etc/hosts ~/hosts.new
sed -i '2 i192.168.33.22 registry.local.lab registry' ~/hosts.new
cp -f ~/hosts.new /etc/hosts

docker build -t academy:1 .
#docker commit edipro-deb79 registry.edi.su/edipro-deb79
docker login -u user -p user registry.local.lab
docker tag academy:1 registry.local.lab/academy:1
docker push registry.local.lab/academy:1