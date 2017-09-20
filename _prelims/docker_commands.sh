#!/bin/sh

# Run Docker commands

set -ex

docker build --no-cache -t custom-nginx:1.13.5 .
docker-compose -f docker-compose.yml -p elk up --force-recreate -d
docker logs nginx --follow
