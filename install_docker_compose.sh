#!/bin/sh

# docker-compose on CentOS 7 AMI
# https://github.com/docker/compose/releases

set -ex

sudo curl -L https://github.com/docker/compose/releases/download/1.15.0-rc1/docker-compose-`uname -s`-`uname -m` > docker-compose
sudo cp docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -v
