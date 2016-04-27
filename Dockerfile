# Script version: 0.0.1
# OS and version
FROM nginx
# Owner
MAINTAINER sg <someone@gmail.com>
# Enviroments
ENV VERSION 0.0.1
ENV DEBIAN_FRONTEND noninteractive
# Configure local time
RUN \
    echo 'Europe/Kiev' > /etc/timezone && \
    dpkg-reconfigure tzdata && \
# Upgrade OS
    apt-get update && \
    apt-get upgrade -y && \
# Install apache, apache-modules
    apt-get install -y vim && \
    apt-get install -y git && \
# clean repositories
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN rm /usr/share/nginx/html/index.html
ADD wa.html /usr/share/nginx/html/index.html
# Open ports in docker (if you don't use start options -p 8880:8880 port will open randomly on base host)
EXPOSE 80/tcp
# Run apache (docker don't autostart services)
CMD ["nginx","-g","daemon off;"]
##ENTRYPOINT ["/bin/bash"]

