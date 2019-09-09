#!/bin/sh

sudo chown 1000 /var/jenkins_home
sudo docker-compose up

# docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword


# docker run --add-host dockerhost:`/sbin/ip route|awk '/default/ { print  $3}'` [my container]