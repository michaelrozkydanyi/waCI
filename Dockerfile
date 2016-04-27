FROM ubuntu:14.04
MAINTAINER jerome.petazzoni@docker.com

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    lxc \
    iptables
    
# Install Docker from Docker Inc. repositories.
ADD devdockerCA.crt /usr/local/share/ca-certificates/docker-dev-cert/devdockerCA.crt
RUN update-ca-certificates --fresh
ADD config.json /root/.docker/config.json
RUN curl -sSL https://get.docker.com/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
